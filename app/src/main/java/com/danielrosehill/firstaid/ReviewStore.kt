package com.danielrosehill.firstaid

import android.content.Context
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.setValue
import org.json.JSONArray
import org.json.JSONObject
import java.time.LocalDate
import java.time.temporal.ChronoUnit

// Spaced review progress, stored on-device only (SharedPreferences, one JSON blob).
// Each (topic, age) unit records the date it was first completed and every
// later review. The next review is due after an interval that grows with the
// number of reviews already done.

data class UnitProgress(val completed: LocalDate, val reviews: List<LocalDate>) {
    val last: LocalDate get() = reviews.lastOrNull() ?: completed
    val nextDue: LocalDate
        get() = last.plusDays(INTERVALS_DAYS[reviews.size.coerceAtMost(INTERVALS_DAYS.lastIndex)])

    fun daysUntilDue(today: LocalDate = LocalDate.now()) = ChronoUnit.DAYS.between(today, nextDue)

    companion object {
        // 1 week, 1 month, 3 months, 6 months, then yearly.
        val INTERVALS_DAYS = longArrayOf(7, 30, 90, 180, 365)
    }
}

class ReviewStore(ctx: Context) {
    private val prefs = ctx.getSharedPreferences("review", Context.MODE_PRIVATE)
    private var data: MutableMap<String, UnitProgress> = load()

    // Compose state: readers observe it, writers bump it, so screens recompose
    // in place (keeping scroll position) when progress changes.
    private var revision by mutableIntStateOf(0)

    private fun key(topic: String, age: Age) = "$topic/${age.key}"

    fun get(topic: String, age: Age): UnitProgress? { revision; return data[key(topic, age)] }
    fun all(): Map<String, UnitProgress> { revision; return data.toMap() }

    fun markCompleted(topic: String, age: Age) {
        if (data[key(topic, age)] == null) {
            data[key(topic, age)] = UnitProgress(LocalDate.now(), emptyList())
            save()
        }
    }

    fun markReviewed(topic: String, age: Age) {
        val cur = data[key(topic, age)] ?: return markCompleted(topic, age)
        data[key(topic, age)] = cur.copy(reviews = cur.reviews + LocalDate.now())
        save()
    }

    fun clear(topic: String, age: Age) {
        data.remove(key(topic, age)); save()
    }

    fun resetAll() {
        data.clear(); save()
    }

    // Plain JSON so the same blob can later be synced (Phase 2: Google Drive).
    fun exportJson(): String = JSONObject().apply {
        for ((k, v) in data) put(k, JSONObject().apply {
            put("completed", v.completed.toString())
            put("reviews", JSONArray(v.reviews.map { it.toString() }))
        })
    }.toString()

    private fun save() {
        prefs.edit().putString("progress", exportJson()).apply()
        revision++
    }

    private fun load(): MutableMap<String, UnitProgress> {
        val raw = prefs.getString("progress", null) ?: return mutableMapOf()
        val j = runCatching { JSONObject(raw) }.getOrNull() ?: return mutableMapOf()
        return j.keys().asSequence().associateWith { k ->
            val o = j.getJSONObject(k)
            val r = o.getJSONArray("reviews")
            UnitProgress(LocalDate.parse(o.getString("completed")), (0 until r.length()).map { LocalDate.parse(r.getString(it)) })
        }.toMutableMap()
    }
}
