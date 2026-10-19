package com.danielrosehill.firstaid

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.BackHandler
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Call
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

sealed class Screen {
    data object Home : Screen()
    data class Triage(val node: String) : Screen()
    data object Topics : Screen()
    data class Topic(val topic: String, val age: Age) : Screen()
    data class Walkthrough(val topic: String, val age: Age) : Screen()
    data object Review : Screen()
    data object Contacts : Screen()
    data object About : Screen()
}

val Danger = Color(0xFFC62828)
val Warn = Color(0xFFEF6C00)
val Ok = Color(0xFF2E7D32)

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        val content = Content.load(this)
        val store = ReviewStore(this)
        val prefs = getSharedPreferences("app", Context.MODE_PRIVATE)
        setContent {
            MaterialTheme(colorScheme = lightColorScheme(primary = Color(0xFF1E40AF), error = Danger)) {
                var accepted by remember { mutableStateOf(prefs.getBoolean("disclaimer", false)) }
                if (!accepted) {
                    DisclaimerScreen { prefs.edit().putBoolean("disclaimer", true).apply(); accepted = true }
                } else {
                    App(content, store)
                }
            }
        }
    }
}

fun Context.dial(number: String) {
    startActivity(Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + Uri.encode(number))))
}

@Composable
fun App(content: Content, store: ReviewStore) {
    val stack = remember { mutableStateListOf<Screen>(Screen.Home) }
    var version by remember { mutableIntStateOf(0) } // bumped when review data changes
    val go: (Screen) -> Unit = { stack.add(it) }
    val back: () -> Unit = { if (stack.size > 1) stack.removeAt(stack.lastIndex) }
    BackHandler(enabled = stack.size > 1) { back() }

    val screen = stack.last()
    Scaffold(
        topBar = { if (screen != Screen.Home) TopBar(title(screen, content), back) },
        bottomBar = { EmergencyBar() },
    ) { pad ->
        Box(Modifier.padding(pad).fillMaxSize()) {
            key(version) {
                when (screen) {
                    Screen.Home -> HomeScreen(content, store, go)
                    is Screen.Triage -> TriageScreen(content, screen.node, go)
                    Screen.Topics -> TopicsScreen(content, store, go)
                    is Screen.Topic -> TopicScreen(content, store, screen.topic, screen.age, go, { stack[stack.lastIndex] = it }) { version++ }
                    is Screen.Walkthrough -> WalkthroughScreen(content, screen.topic, screen.age)
                    Screen.Review -> ReviewScreen(content, store, go) { version++ }
                    Screen.Contacts -> ContactsScreen(content)
                    Screen.About -> AboutScreen()
                }
            }
        }
    }
}

fun title(s: Screen, c: Content) = when (s) {
    Screen.Home -> "First Aid"
    is Screen.Triage -> "What's happening?"
    Screen.Topics -> "Topics"
    is Screen.Topic -> c.name(s.topic)
    is Screen.Walkthrough -> c.name(s.topic) + " — step by step"
    Screen.Review -> "Review"
    Screen.Contacts -> "Numbers"
    Screen.About -> "About"
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TopBar(title: String, back: () -> Unit) {
    TopAppBar(
        title = { Text(title, maxLines = 1) },
        navigationIcon = { IconButton(onClick = back) { Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back") } },
    )
}

// Pinned on every screen: the one action that must never be more than a tap away.
@Composable
fun EmergencyBar() {
    val ctx = androidx.compose.ui.platform.LocalContext.current
    Row(
        Modifier.fillMaxWidth().background(Danger).navigationBarsPadding()
            .clickable { ctx.dial("101") }.padding(14.dp),
        horizontalArrangement = Arrangement.Center, verticalAlignment = Alignment.CenterVertically,
    ) {
        Icon(Icons.Filled.Call, null, tint = Color.White)
        Spacer(Modifier.width(10.dp))
        Text("CALL 101 — Magen David Adom", color = Color.White, fontWeight = FontWeight.Bold, fontSize = 18.sp)
    }
}

@Composable
fun BigButton(label: String, sub: String?, color: Color, onClick: () -> Unit) {
    Card(
        Modifier.fillMaxWidth().padding(vertical = 6.dp).clickable(onClick = onClick),
        colors = CardDefaults.cardColors(containerColor = color),
    ) {
        Column(Modifier.padding(18.dp)) {
            Text(label, color = Color.White, fontWeight = FontWeight.Bold, fontSize = 20.sp)
            if (sub != null) Text(sub, color = Color.White.copy(alpha = 0.9f), fontSize = 14.sp)
        }
    }
}

@Composable
fun HomeScreen(c: Content, store: ReviewStore, go: (Screen) -> Unit) {
    val due = store.all().values.count { it.daysUntilDue() <= 0 }
    Column(Modifier.fillMaxSize().verticalScroll(rememberScrollState()).statusBarsPadding().padding(16.dp)) {
        Text("First Aid", fontSize = 28.sp, fontWeight = FontWeight.Bold)
        Text("Family reference · MDA / Hatzalah guidance · offline", color = Color.Gray)
        Spacer(Modifier.height(12.dp))
        BigButton("What's happening?", "Emergency decision guide", Danger) { go(Screen.Triage(c.triageRoot)) }
        BigButton("Topics", "Browse by type of emergency", Color(0xFF1E40AF)) { go(Screen.Topics) }
        BigButton(
            "Review",
            if (due > 0) "$due topic(s) due for review" else "Spaced review and progress",
            if (due > 0) Warn else Ok,
        ) { go(Screen.Review) }
        BigButton("Numbers", "Emergency services, Terem, Maccabi", Color(0xFF455A64)) { go(Screen.Contacts) }
        TextButton(onClick = { go(Screen.About) }) { Text("About and disclaimer") }
    }
}

@Composable
fun TriageScreen(c: Content, nodeId: String, go: (Screen) -> Unit) {
    val ctx = androidx.compose.ui.platform.LocalContext.current
    val node = c.triage[nodeId] ?: return
    var age by remember { mutableStateOf(Age.ADULT) }
    LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp)) {
        item {
            Text(node.question, fontSize = 24.sp, fontWeight = FontWeight.Bold, modifier = Modifier.padding(top = 12.dp))
            node.helper?.let { Text(it, color = Color.DarkGray, modifier = Modifier.padding(vertical = 6.dp)) }
            AgeToggle(age) { age = it }
        }
        items(node.answers) { a ->
            val color = when (a.emphasis) { "danger" -> Danger; "warn" -> Warn; "ok" -> Ok; else -> Color(0xFF37474F) }
            BigButton(a.label, null, color) {
                when (val act = a.action) {
                    is TriageAction.Goto -> go(Screen.Triage(act.node))
                    is TriageAction.Call -> ctx.dial(act.number)
                    is TriageAction.OpenTopic -> go(Screen.Topic(act.topic, age))
                }
            }
        }
        item { Spacer(Modifier.height(24.dp)) }
    }
}

@Composable
fun AgeToggle(age: Age, onChange: (Age) -> Unit) {
    Row(Modifier.fillMaxWidth().padding(vertical = 8.dp), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
        Age.entries.forEach {
            FilterChip(selected = age == it, onClick = { onChange(it) }, label = { Text(it.label) })
        }
    }
}

@Composable
fun StatusDot(p: UnitProgress?) {
    val (color, label) = when {
        p == null -> Color.LightGray to "not started"
        p.daysUntilDue() <= 0 -> Warn to "review due"
        else -> Ok to "due in ${p.daysUntilDue()}d"
    }
    Text(label, color = color, fontSize = 12.sp, fontWeight = FontWeight.Medium)
}

@Composable
fun TopicsScreen(c: Content, store: ReviewStore, go: (Screen) -> Unit) {
    var query by remember { mutableStateOf("") }
    val q = query.trim().lowercase()
    LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp)) {
        item {
            OutlinedTextField(query, { query = it }, Modifier.fillMaxWidth().padding(vertical = 8.dp),
                placeholder = { Text("Search") }, singleLine = true)
        }
        for (g in c.groups) {
            val topics = g.topics.filter { t ->
                q.isEmpty() || c.name(t).lowercase().contains(q) ||
                    Age.entries.any { c.protocol(t, it)?.let { p -> p.summary.lowercase().contains(q) || p.title.lowercase().contains(q) } == true }
            }
            if (topics.isEmpty()) continue
            item { Text(g.title.uppercase(), color = Color.Gray, fontSize = 13.sp, fontWeight = FontWeight.Bold, modifier = Modifier.padding(top = 14.dp, bottom = 4.dp)) }
            items(topics) { t ->
                Card(Modifier.fillMaxWidth().padding(vertical = 3.dp).clickable { go(Screen.Topic(t, Age.ADULT)) }) {
                    Row(Modifier.padding(14.dp), verticalAlignment = Alignment.CenterVertically) {
                        Text(c.name(t), Modifier.weight(1f), fontSize = 17.sp)
                        Column(horizontalAlignment = Alignment.End) {
                            Age.entries.forEach { a ->
                                Row { Text(if (a == Age.ADULT) "A " else "C ", fontSize = 12.sp, color = Color.Gray); StatusDot(store.get(t, a)) }
                            }
                        }
                    }
                }
            }
        }
        item { Spacer(Modifier.height(24.dp)) }
    }
}

@Composable
fun Section(title: String, color: Color = Color(0xFF1E40AF), body: @Composable ColumnScope.() -> Unit) {
    Column(Modifier.fillMaxWidth().padding(vertical = 8.dp)) {
        Text(title, fontWeight = FontWeight.Bold, color = color, fontSize = 16.sp)
        Spacer(Modifier.height(4.dp))
        body()
    }
}

@Composable
fun TopicScreen(
    c: Content, store: ReviewStore, topic: String, age: Age,
    go: (Screen) -> Unit, replace: (Screen) -> Unit, changed: () -> Unit,
) {
    val ctx = androidx.compose.ui.platform.LocalContext.current
    val p = c.protocol(topic, age) ?: return Text("No protocol for this age group.", Modifier.padding(16.dp))
    val progress = store.get(topic, age)
    Column(Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(horizontal = 16.dp)) {
        AgeToggle(age) { replace(Screen.Topic(topic, it)) }
        Button(onClick = { go(Screen.Walkthrough(topic, age)) }, Modifier.fillMaxWidth(),
            colors = ButtonDefaults.buttonColors(containerColor = Danger)) {
            Text("Step-by-step decision guide", fontSize = 17.sp, modifier = Modifier.padding(6.dp))
        }
        Card(Modifier.fillMaxWidth().padding(vertical = 8.dp).clickable { ctx.dial(p.callNumber) },
            colors = CardDefaults.cardColors(containerColor = Color(0xFFFFEBEE))) {
            Column(Modifier.padding(12.dp)) {
                Text("Call ${p.callNumber}", fontWeight = FontWeight.Bold, color = Danger, fontSize = 18.sp)
                Text(p.callWhen, fontSize = 14.sp)
            }
        }
        Section("Summary") { Text(p.summary) }
        Section("When to use") { Text(p.whenToApply) }
        Section("Steps") {
            p.steps.forEach { s -> StepCard(s) }
        }
        if (p.doNot.isNotEmpty()) Section("Do NOT", Danger) { p.doNot.forEach { Text("•  $it", Modifier.padding(vertical = 2.dp)) } }
        if (p.equipment.isNotEmpty()) Section("Equipment") { p.equipment.forEach { Text("•  $it", Modifier.padding(vertical = 2.dp)) } }
        Section("Source", Color.Gray) {
            Text("${p.sourceAuthority} — ${p.sourceTitle}", fontSize = 13.sp)
            p.sourceUrl?.let { Text(it, fontSize = 12.sp, color = Color.Gray) }
            p.notes?.let { Text(it, fontSize = 12.sp, color = Color.Gray, modifier = Modifier.padding(top = 4.dp)) }
        }
        HorizontalDivider(Modifier.padding(vertical = 8.dp))
        Section("Your progress") {
            if (progress == null) {
                Text("Not completed yet.")
                Button(onClick = { store.markCompleted(topic, age); changed() }) { Text("Mark as completed") }
            } else {
                Text("Completed ${progress.completed}")
                progress.reviews.forEach { Text("Reviewed $it", fontSize = 13.sp, color = Color.DarkGray) }
                Text("Next review: ${progress.nextDue}", fontWeight = FontWeight.Medium)
                Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    Button(onClick = { store.markReviewed(topic, age); changed() }) { Text("Mark as reviewed") }
                    OutlinedButton(onClick = { store.clear(topic, age); changed() }) { Text("Reset") }
                }
            }
        }
        Spacer(Modifier.height(32.dp))
    }
}

@Composable
fun StepCard(s: Step) {
    Card(Modifier.fillMaxWidth().padding(vertical = 4.dp)) {
        Column(Modifier.padding(12.dp)) {
            Text("${s.number}. ${s.instruction}", fontWeight = FontWeight.SemiBold)
            s.detail?.let { Text(it, fontSize = 14.sp, color = Color.DarkGray, modifier = Modifier.padding(top = 4.dp)) }
            s.warning?.let { Text("⚠ $it", fontSize = 14.sp, color = Warn, modifier = Modifier.padding(top = 4.dp)) }
            s.decision?.let { d ->
                Column(Modifier.padding(top = 6.dp).background(Color(0xFFF1F5F9), RoundedCornerShape(6.dp)).padding(8.dp)) {
                    Text(d.condition, fontWeight = FontWeight.Medium)
                    Text("YES → ${d.ifYes}", color = Ok, fontSize = 14.sp)
                    Text("NO → ${d.ifNo}", color = Danger, fontSize = 14.sp)
                }
            }
        }
    }
}

private val STEP_REF = Regex("""[Ss]tep\s+(\d+)""")

// The protocol as an interactive flowchart: one step on screen at a time, and at
// each decision point the answer chosen decides where to go next. Outcomes that
// name a step ("Proceed to Step 7") become a jump to that step.
@Composable
fun WalkthroughScreen(c: Content, topic: String, age: Age) {
    val p = c.protocol(topic, age) ?: return
    var index by remember { mutableIntStateOf(0) }
    var answer by remember { mutableStateOf<Boolean?>(null) }
    val history = remember { mutableStateListOf<Int>() }
    val step = p.steps.getOrNull(index)

    fun goTo(i: Int) { history.add(index); index = i; answer = null }

    Column(Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(16.dp)) {
        LinearProgressIndicator(progress = { (index + 1f) / p.steps.size }, Modifier.fillMaxWidth())
        Text("${age.label} · step ${minOf(index + 1, p.steps.size)} of ${p.steps.size}", color = Color.Gray, fontSize = 13.sp)
        Spacer(Modifier.height(12.dp))
        if (step == null) {
            Text("End of protocol", fontSize = 24.sp, fontWeight = FontWeight.Bold)
            Text("Keep monitoring the person and stay on the line with 101 until help arrives.")
            Button(onClick = { history.clear(); index = 0; answer = null }) { Text("Start again") }
            return@Column
        }
        Text(step.instruction, fontSize = 24.sp, fontWeight = FontWeight.Bold, lineHeight = 30.sp)
        step.detail?.let { Text(it, fontSize = 16.sp, modifier = Modifier.padding(top = 8.dp)) }
        step.warning?.let { Text("⚠ $it", color = Warn, modifier = Modifier.padding(top = 8.dp)) }
        Spacer(Modifier.height(16.dp))
        val d = step.decision
        if (d != null) {
            Text(d.condition, fontSize = 20.sp, fontWeight = FontWeight.SemiBold)
            Row(Modifier.fillMaxWidth().padding(vertical = 10.dp), horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                Button(onClick = { answer = true }, Modifier.weight(1f).height(64.dp),
                    colors = ButtonDefaults.buttonColors(containerColor = Ok)) { Text("YES", fontSize = 20.sp) }
                Button(onClick = { answer = false }, Modifier.weight(1f).height(64.dp),
                    colors = ButtonDefaults.buttonColors(containerColor = Danger)) { Text("NO", fontSize = 20.sp) }
            }
            answer?.let { yes ->
                val outcome = if (yes) d.ifYes else d.ifNo
                Card(colors = CardDefaults.cardColors(containerColor = if (yes) Color(0xFFE8F5E9) else Color(0xFFFFEBEE))) {
                    Text(outcome, Modifier.padding(12.dp), fontSize = 17.sp)
                }
                val target = STEP_REF.find(outcome)?.groupValues?.get(1)?.toIntOrNull()
                    ?.let { n -> p.steps.indexOfFirst { it.number == n } }?.takeIf { it >= 0 }
                Spacer(Modifier.height(10.dp))
                if (target != null && target != index + 1) {
                    Button(onClick = { goTo(target) }, Modifier.fillMaxWidth()) { Text("Go to step ${p.steps[target].number}") }
                }
                OutlinedButton(onClick = { goTo(index + 1) }, Modifier.fillMaxWidth()) { Text("Next step") }
            }
        } else {
            Button(onClick = { goTo(index + 1) }, Modifier.fillMaxWidth().height(56.dp)) { Text("Done — next step", fontSize = 18.sp) }
        }
        if (history.isNotEmpty()) {
            TextButton(onClick = { index = history.removeAt(history.lastIndex); answer = null }) { Text("Previous step") }
        }
    }
}

@Composable
fun ReviewScreen(c: Content, store: ReviewStore, go: (Screen) -> Unit, changed: () -> Unit) {
    val units = c.allTopics.flatMap { t -> Age.entries.map { t to it } }
    val done = units.count { (t, a) -> store.get(t, a) != null }
    val due = units.mapNotNull { (t, a) -> store.get(t, a)?.let { Triple(t, a, it) } }
        .sortedBy { it.third.nextDue }
    var confirm by remember { mutableStateOf(false) }
    LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp)) {
        item {
            Text("Progress: $done of ${units.size} completed", fontSize = 18.sp, fontWeight = FontWeight.Bold, modifier = Modifier.padding(top = 12.dp))
            LinearProgressIndicator(progress = { done.toFloat() / units.size }, Modifier.fillMaxWidth().padding(vertical = 8.dp).height(10.dp))
            Text("Each topic is learned once per age group, then reviewed after 1 week, 1 month, 3 months, 6 months and yearly.", fontSize = 13.sp, color = Color.DarkGray)
            Spacer(Modifier.height(8.dp))
            Text("SCHEDULE", color = Color.Gray, fontSize = 13.sp, fontWeight = FontWeight.Bold)
            if (due.isEmpty()) Text("Nothing completed yet. Open a topic and mark it completed to start.", Modifier.padding(vertical = 8.dp))
        }
        items(due) { (t, a, p) ->
            Card(Modifier.fillMaxWidth().padding(vertical = 3.dp).clickable { go(Screen.Topic(t, a)) }) {
                Row(Modifier.padding(12.dp), verticalAlignment = Alignment.CenterVertically) {
                    Column(Modifier.weight(1f)) {
                        Text("${c.name(t)} · ${a.label}", fontWeight = FontWeight.Medium)
                        Text("Last ${p.last} · next ${p.nextDue}", fontSize = 12.sp, color = Color.Gray)
                    }
                    StatusDot(p)
                }
            }
        }
        item {
            Spacer(Modifier.height(16.dp))
            if (!confirm) OutlinedButton(onClick = { confirm = true }) { Text("Reset all progress") }
            else Row(verticalAlignment = Alignment.CenterVertically) {
                Text("Erase all progress?", Modifier.weight(1f))
                Button(onClick = { store.resetAll(); confirm = false; changed() },
                    colors = ButtonDefaults.buttonColors(containerColor = Danger)) { Text("Erase") }
                TextButton(onClick = { confirm = false }) { Text("Cancel") }
            }
            Spacer(Modifier.height(24.dp))
        }
    }
}

@Composable
fun ContactsScreen(c: Content) {
    val ctx = androidx.compose.ui.platform.LocalContext.current
    LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp)) {
        for (g in c.contacts) {
            item { Text(g.title.uppercase(), color = Color.Gray, fontSize = 13.sp, fontWeight = FontWeight.Bold, modifier = Modifier.padding(top = 14.dp, bottom = 4.dp)) }
            items(g.items) { ct ->
                Card(Modifier.fillMaxWidth().padding(vertical = 3.dp).clickable { ctx.dial(ct.number) },
                    colors = CardDefaults.cardColors(containerColor = if (ct.primary) Color(0xFFFFEBEE) else MaterialTheme.colorScheme.surfaceVariant)) {
                    Row(Modifier.padding(14.dp), verticalAlignment = Alignment.CenterVertically) {
                        Column(Modifier.weight(1f)) {
                            Text(ct.name, fontWeight = FontWeight.Medium)
                            ct.note?.let { Text(it, fontSize = 12.sp, color = Color.DarkGray) }
                        }
                        Text(ct.number, fontWeight = FontWeight.Bold, color = if (ct.primary) Danger else Color(0xFF1E40AF))
                    }
                }
            }
        }
        item { Text("Numbers verified ${c.contactsVerified}. Check before relying on them.", fontSize = 12.sp, color = Color.Gray, modifier = Modifier.padding(vertical = 16.dp)) }
    }
}

const val DISCLAIMER = "This app is a personal study and reference aid. It is not an official Magen David Adom, " +
    "United Hatzalah or Ministry of Health product, and it is not medical advice. It does not replace first aid " +
    "training. Guidelines change; verify against the source organisation. In an emergency, call 101 first."

@Composable
fun AboutScreen() {
    Column(Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(16.dp)) {
        Text(DISCLAIMER)
        Spacer(Modifier.height(12.dp))
        Text("Content: 28 topics × adult and child protocols, compiled from MDA and United Hatzalah public guidance, with international (e.g. American Red Cross / AHA) guidance where Israeli guidance was silent. Each protocol lists its source.")
        Spacer(Modifier.height(12.dp))
        Text("Everything runs offline. Review progress is stored only on this device.")
        Spacer(Modifier.height(12.dp))
        val ctx = androidx.compose.ui.platform.LocalContext.current
        val version = runCatching { ctx.packageManager.getPackageInfo(ctx.packageName, 0).versionName }.getOrNull()
        Text("Version ${version ?: "?"}", color = Color.Gray)
    }
}

@Composable
fun DisclaimerScreen(onAccept: () -> Unit) {
    Column(Modifier.fillMaxSize().statusBarsPadding().padding(24.dp), verticalArrangement = Arrangement.Center) {
        Text("Before you start", fontSize = 26.sp, fontWeight = FontWeight.Bold)
        Spacer(Modifier.height(12.dp))
        Text(DISCLAIMER, fontSize = 17.sp)
        Spacer(Modifier.height(24.dp))
        Button(onClick = onAccept, Modifier.fillMaxWidth().height(56.dp)) { Text("I understand", fontSize = 18.sp) }
        Text("Emergency: 101", Modifier.fillMaxWidth().padding(top = 16.dp), textAlign = TextAlign.Center, color = Danger, fontWeight = FontWeight.Bold)
    }
}
