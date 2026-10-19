package com.danielrosehill.firstaid

import android.content.Context
import org.json.JSONArray
import org.json.JSONObject

// All content ships in assets/ and is parsed once at startup. Nothing is fetched
// from the network: an update to the content is a new APK release.

enum class Age(val key: String, val label: String) {
    ADULT("adult", "Adult"),
    CHILD("child", "Child / infant"),
}

data class Decision(val condition: String, val ifYes: String, val ifNo: String)

data class Step(
    val number: Int,
    val instruction: String,
    val detail: String?,
    val warning: String?,
    val decision: Decision?,
)

data class Protocol(
    val topic: String,
    val age: Age,
    val title: String,
    val summary: String,
    val whenToApply: String,
    val callNumber: String,
    val callWhen: String,
    val steps: List<Step>,
    val doNot: List<String>,
    val equipment: List<String>,
    val sourceAuthority: String,
    val sourceTitle: String,
    val sourceUrl: String?,
    val notes: String?,
)

data class TopicGroup(val title: String, val topics: List<String>)

sealed class TriageAction {
    data class OpenTopic(val topic: String) : TriageAction()
    data class Call(val number: String) : TriageAction()
    data class Goto(val node: String) : TriageAction()
}

data class TriageAnswer(val label: String, val emphasis: String?, val action: TriageAction)
data class TriageNode(val id: String, val question: String, val helper: String?, val answers: List<TriageAnswer>)

data class Contact(val name: String, val number: String, val note: String?, val primary: Boolean)
data class ContactGroup(val title: String, val items: List<Contact>)

class Content(
    val groups: List<TopicGroup>,
    val names: Map<String, String>,
    val protocols: Map<Pair<String, Age>, Protocol>,
    val triageRoot: String,
    val triage: Map<String, TriageNode>,
    val contacts: List<ContactGroup>,
    val contactsVerified: String,
) {
    val allTopics: List<String> get() = groups.flatMap { it.topics }
    fun name(topic: String) = names[topic] ?: topic
    fun protocol(topic: String, age: Age) = protocols[topic to age]

    companion object {
        fun load(ctx: Context): Content {
            fun read(path: String) = ctx.assets.open(path).bufferedReader().use { it.readText() }

            val topicsJson = JSONObject(read("topics.json"))
            val groups = topicsJson.getJSONArray("groups").objects().map {
                TopicGroup(it.getString("title"), it.getJSONArray("topics").strings())
            }
            val namesJson = topicsJson.getJSONObject("names")
            val names = namesJson.keys().asSequence().associateWith { namesJson.getString(it) }

            val protocols = mutableMapOf<Pair<String, Age>, Protocol>()
            for (age in Age.entries) {
                val files = ctx.assets.list("protocols/${age.key}") ?: emptyArray()
                for (file in files.filter { it.endsWith(".json") }) {
                    val topic = file.removeSuffix(".json")
                    protocols[topic to age] = parseProtocol(topic, age, JSONObject(read("protocols/${age.key}/$file")))
                }
            }

            val triageJson = JSONObject(read("triage.json"))
            val nodesJson = triageJson.getJSONObject("nodes")
            val triage = nodesJson.keys().asSequence().associateWith { key ->
                val n = nodesJson.getJSONObject(key)
                TriageNode(
                    id = key,
                    question = n.getString("question"),
                    helper = n.optStringOrNull("helper"),
                    answers = n.getJSONArray("answers").objects().map { a ->
                        val act = a.getJSONObject("action")
                        val action = when {
                            act.has("goto") -> TriageAction.Goto(act.getString("goto"))
                            act.optString("route") == "call" -> TriageAction.Call(act.getString("number"))
                            else -> TriageAction.OpenTopic(act.getString("category"))
                        }
                        TriageAnswer(a.getString("label"), a.optStringOrNull("emphasis"), action)
                    },
                )
            }

            val contactsJson = JSONObject(read("contacts.json"))
            val contacts = contactsJson.getJSONArray("groups").objects().map { g ->
                ContactGroup(g.getString("title"), g.getJSONArray("items").objects().map {
                    Contact(it.getString("name"), it.getString("number"), it.optStringOrNull("note"), it.optBoolean("primary"))
                })
            }

            return Content(
                groups, names, protocols,
                triageJson.getString("root"), triage,
                contacts, contactsJson.getString("verified"),
            )
        }

        private fun parseProtocol(topic: String, age: Age, j: JSONObject): Protocol {
            val p = j.getJSONObject("protocol")
            val call = p.getJSONObject("call_emergency")
            val src = j.getJSONObject("source")
            return Protocol(
                topic = topic,
                age = age,
                title = j.getString("title"),
                summary = p.getString("summary"),
                whenToApply = p.getString("when_to_apply"),
                callNumber = call.getString("number"),
                callWhen = call.getString("when"),
                steps = p.getJSONArray("steps").objects().map { s ->
                    Step(
                        number = s.getInt("step_number"),
                        instruction = s.getString("instruction"),
                        detail = s.optStringOrNull("detail"),
                        warning = s.optStringOrNull("warning"),
                        decision = s.optJSONObject("decision_point")?.let {
                            Decision(it.getString("condition"), it.getString("if_yes"), it.getString("if_no"))
                        },
                    )
                },
                doNot = p.getJSONArray("do_not").strings(),
                equipment = p.getJSONArray("equipment_needed").strings(),
                sourceAuthority = src.getString("authority"),
                sourceTitle = src.getString("document_title"),
                sourceUrl = src.optStringOrNull("url"),
                notes = j.optJSONObject("import_metadata")?.optStringOrNull("notes"),
            )
        }
    }
}

private fun JSONArray.objects(): List<JSONObject> = (0 until length()).map { getJSONObject(it) }

// Items are usually strings; anything else (an object) is flattened to its text.
private fun JSONArray.strings(): List<String> = (0 until length()).map {
    when (val v = get(it)) {
        is JSONObject -> v.optStringOrNull("item") ?: v.optStringOrNull("name") ?: v.toString()
        else -> v.toString()
    }
}

private fun JSONObject.optStringOrNull(key: String): String? =
    if (has(key) && !isNull(key)) getString(key).takeIf { it.isNotBlank() } else null
