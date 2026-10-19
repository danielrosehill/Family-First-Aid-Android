@file:OptIn(ExperimentalMaterial3Api::class)

package com.danielrosehill.firstaid

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.KeyboardArrowRight
import androidx.compose.material.icons.filled.Call
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.Warning
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.onPlaced
import androidx.compose.ui.layout.positionInParent
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.launch

// ---- Shared pieces ----

@Composable
fun SectionLabel(text: String, color: Color = Color.Gray) {
    Text(text.uppercase(), color = color, fontSize = 13.sp, fontWeight = FontWeight.Bold, modifier = Modifier.padding(top = 16.dp, bottom = 6.dp))
}

// A topic's emoji on a disc of its group colour.
@Composable
fun IconBubble(icon: String, color: Color, size: Dp = 44.dp) {
    Box(Modifier.size(size).background(color.tint(0.18f), CircleShape), contentAlignment = Alignment.Center) {
        Text(icon, fontSize = (size.value * 0.5f).sp)
    }
}

@Composable
fun AgeToggle(age: Age, onChange: (Age) -> Unit) {
    SingleChoiceSegmentedButtonRow(Modifier.fillMaxWidth().padding(vertical = 8.dp)) {
        Age.entries.forEachIndexed { i, a ->
            SegmentedButton(
                selected = age == a, onClick = { onChange(a) },
                shape = SegmentedButtonDefaults.itemShape(i, Age.entries.size),
            ) { Text((if (a == Age.ADULT) "🧑 " else "👶 ") + a.label, fontSize = 16.sp) }
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
    Text("● $label", color = color, fontSize = 12.sp, fontWeight = FontWeight.Medium)
}

// ---- Home ----

@Composable
fun HomeScreen(c: Content, store: ReviewStore, age: Age, setAge: (Age) -> Unit, go: (Screen) -> Unit) {
    val due = store.all().values.count { it.daysUntilDue() <= 0 }
    Column(Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(16.dp)) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Image(painterResource(R.drawable.ic_star_of_david), null, Modifier.size(44.dp))
            Spacer(Modifier.width(12.dp))
            Column {
                Text("First Aid", fontSize = 28.sp, fontWeight = FontWeight.Bold)
                Text("Family reference · MDA / Hatzalah guidance · offline", color = Color.Gray, fontSize = 13.sp)
            }
        }
        Spacer(Modifier.height(14.dp))
        Card(
            onClick = { go(Screen.Triage(c.triageRoot)) }, Modifier.fillMaxWidth(),
            colors = CardDefaults.cardColors(containerColor = Danger),
        ) {
            Row(Modifier.padding(20.dp), verticalAlignment = Alignment.CenterVertically) {
                Icon(Icons.Filled.Warning, null, tint = Color.White, modifier = Modifier.size(40.dp))
                Spacer(Modifier.width(14.dp))
                Column(Modifier.weight(1f)) {
                    Text("What's happening?", color = Color.White, fontWeight = FontWeight.Bold, fontSize = 24.sp)
                    Text("Emergency decision guide", color = Color.White.copy(alpha = 0.9f), fontSize = 15.sp)
                }
                Icon(Icons.AutoMirrored.Filled.KeyboardArrowRight, null, tint = Color.White)
            }
        }
        SectionLabel("Who needs help?")
        AgeToggle(age, setAge)
        SectionLabel("Quick access")
        c.quick.chunked(2).forEach { row ->
            Row(Modifier.fillMaxWidth().padding(vertical = 5.dp), horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                row.forEach { t -> QuickTile(c, t, Modifier.weight(1f)) { go(Screen.Topic(t, age)) } }
                if (row.size == 1) Spacer(Modifier.weight(1f))
            }
        }
        if (due > 0) {
            Card(
                onClick = { go(Screen.Review) }, Modifier.fillMaxWidth().padding(top = 12.dp),
                colors = CardDefaults.cardColors(containerColor = Warn.tint(0.2f)),
            ) {
                Text("🔔  $due topic(s) due for review", Modifier.padding(16.dp), color = Warn, fontWeight = FontWeight.Bold)
            }
        }
        TextButton(onClick = { go(Screen.About) }, Modifier.padding(top = 8.dp)) { Text("About and disclaimer") }
    }
}

@Composable
fun QuickTile(c: Content, topic: String, modifier: Modifier, onClick: () -> Unit) {
    val color = topicColor(c, topic)
    Card(
        onClick = onClick, modifier.height(96.dp),
        colors = CardDefaults.cardColors(containerColor = color.tint()),
        border = BorderStroke(1.5.dp, color.copy(alpha = 0.5f)),
    ) {
        Column(Modifier.fillMaxSize().padding(12.dp), verticalArrangement = Arrangement.SpaceBetween) {
            Text(c.icon(topic), fontSize = 28.sp)
            Text(c.name(topic), color = color, fontWeight = FontWeight.Bold, fontSize = 15.sp, maxLines = 2, lineHeight = 18.sp)
        }
    }
}

// ---- Triage ----

@Composable
fun TriageScreen(c: Content, nodeId: String, age: Age, setAge: (Age) -> Unit, go: (Screen) -> Unit) {
    val ctx = LocalContext.current
    val node = c.triage[nodeId] ?: return
    LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp)) {
        item {
            Text(node.question, fontSize = 24.sp, fontWeight = FontWeight.Bold, modifier = Modifier.padding(top = 12.dp))
            node.helper?.let { Text(it, color = Color.DarkGray, modifier = Modifier.padding(vertical = 6.dp)) }
            AgeToggle(age, setAge)
        }
        items(node.answers) { a ->
            val act = a.action
            val icon = when (act) {
                is TriageAction.OpenTopic -> c.icon(act.topic)
                is TriageAction.Call -> "📞"
                is TriageAction.Goto -> a.icon ?: "❓"
            }
            // Urgent answers are solid red (or green for "yes, breathing"); the rest
            // take the colour of the topic group they lead to.
            val solid = when (a.emphasis) { "danger" -> Danger; "warn" -> Warn; "ok" -> Ok; else -> null }
            val color = solid ?: (act as? TriageAction.OpenTopic)?.let { topicColor(c, it.topic) } ?: Slate
            Card(
                onClick = {
                    when (act) {
                        is TriageAction.Goto -> go(Screen.Triage(act.node, a.label))
                        is TriageAction.Call -> ctx.dial(act.number)
                        is TriageAction.OpenTopic -> go(Screen.Topic(act.topic, age))
                    }
                },
                Modifier.fillMaxWidth().padding(vertical = 5.dp),
                colors = CardDefaults.cardColors(containerColor = solid ?: color.tint()),
                border = if (solid == null) BorderStroke(1.5.dp, color.copy(alpha = 0.5f)) else null,
            ) {
                Row(Modifier.padding(horizontal = 14.dp, vertical = 16.dp), verticalAlignment = Alignment.CenterVertically) {
                    Text(icon, fontSize = 26.sp)
                    Spacer(Modifier.width(12.dp))
                    Text(a.label, Modifier.weight(1f), color = if (solid != null) Color.White else Color.Black,
                        fontWeight = FontWeight.Bold, fontSize = 18.sp)
                    Icon(Icons.AutoMirrored.Filled.KeyboardArrowRight, null, tint = if (solid != null) Color.White else color)
                }
            }
        }
        item { Spacer(Modifier.height(24.dp)) }
    }
}

// ---- Topics ----

@Composable
fun TopicsScreen(c: Content, store: ReviewStore, age: Age, go: (Screen) -> Unit) {
    var query by rememberSaveable { mutableStateOf("") }
    val q = query.trim().lowercase()
    LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp)) {
        item {
            OutlinedTextField(query, { query = it }, Modifier.fillMaxWidth().padding(vertical = 8.dp),
                placeholder = { Text("Search topics") }, singleLine = true,
                leadingIcon = { Icon(Icons.Filled.Search, null) })
        }
        for (g in c.groups) {
            val topics = g.topics.filter { t ->
                q.isEmpty() || c.name(t).lowercase().contains(q) ||
                    Age.entries.any { c.protocol(t, it)?.let { p -> p.summary.lowercase().contains(q) || p.title.lowercase().contains(q) } == true }
            }
            if (topics.isEmpty()) continue
            val color = g.color?.let { Color(it) } ?: Blue
            item {
                Row(Modifier.padding(top = 16.dp, bottom = 6.dp), verticalAlignment = Alignment.CenterVertically) {
                    Box(Modifier.size(width = 4.dp, height = 18.dp).background(color, RoundedCornerShape(2.dp)))
                    Spacer(Modifier.width(8.dp))
                    Text(g.title.uppercase(), color = color, fontSize = 13.sp, fontWeight = FontWeight.Bold)
                }
            }
            items(topics) { t ->
                Card(
                    onClick = { go(Screen.Topic(t, age)) }, Modifier.fillMaxWidth().padding(vertical = 3.dp),
                    colors = CardDefaults.cardColors(containerColor = Color.White),
                    border = BorderStroke(1.dp, color.copy(alpha = 0.3f)),
                ) {
                    Row(Modifier.padding(10.dp), verticalAlignment = Alignment.CenterVertically) {
                        IconBubble(c.icon(t), color)
                        Spacer(Modifier.width(12.dp))
                        Text(c.name(t), Modifier.weight(1f), fontSize = 17.sp, fontWeight = FontWeight.Medium)
                        Column(horizontalAlignment = Alignment.End) {
                            Age.entries.forEach { a ->
                                Row { Text(if (a == Age.ADULT) "Adult " else "Child ", fontSize = 12.sp, color = Color.Gray); StatusDot(store.get(t, a)) }
                            }
                        }
                    }
                }
            }
        }
        item { Spacer(Modifier.height(24.dp)) }
    }
}

// ---- One topic ----

@Composable
fun Section(
    title: String, icon: String, color: Color = Blue, modifier: Modifier = Modifier,
    body: @Composable ColumnScope.() -> Unit,
) {
    Column(modifier.fillMaxWidth().padding(vertical = 10.dp)) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(icon, fontSize = 18.sp)
            Spacer(Modifier.width(8.dp))
            Text(title, fontWeight = FontWeight.Bold, color = color, fontSize = 17.sp)
        }
        Spacer(Modifier.height(6.dp))
        body()
    }
}

@Composable
fun TopicScreen(c: Content, store: ReviewStore, topic: String, age: Age, go: (Screen) -> Unit, setAge: (Age) -> Unit) {
    val ctx = LocalContext.current
    val p = c.protocol(topic, age) ?: return Text("No protocol for this age group.", Modifier.padding(16.dp))
    val progress = store.get(topic, age)
    val color = topicColor(c, topic)
    val scroll = rememberScrollState()
    val scope = rememberCoroutineScope()
    // Where each section starts, so the chips at the top can jump to it.
    val anchors = remember { mutableStateMapOf<String, Int>() }
    fun Modifier.anchor(name: String) = onPlaced { anchors[name] = it.positionInParent().y.toInt() }

    Column(Modifier.fillMaxSize().verticalScroll(scroll).padding(horizontal = 16.dp)) {
        Row(Modifier.fillMaxWidth().padding(top = 14.dp), verticalAlignment = Alignment.CenterVertically) {
            IconBubble(c.icon(topic), color, 56.dp)
            Column(Modifier.padding(start = 12.dp).weight(1f)) {
                c.groupOf(topic)?.let { Text(it.title.uppercase(), color = color, fontSize = 12.sp, fontWeight = FontWeight.Bold) }
                Text(c.name(topic), fontSize = 22.sp, fontWeight = FontWeight.Bold)
            }
        }
        AgeToggle(age, setAge)
        Button(
            onClick = { go(Screen.Walkthrough(topic, age)) }, Modifier.fillMaxWidth().height(60.dp),
            colors = ButtonDefaults.buttonColors(containerColor = Danger),
        ) {
            Icon(Icons.Filled.PlayArrow, null)
            Spacer(Modifier.width(8.dp))
            Text("Step-by-step decision guide", fontSize = 18.sp, fontWeight = FontWeight.Bold)
        }
        Card(
            onClick = { ctx.dial(p.callNumber) }, Modifier.fillMaxWidth().padding(vertical = 8.dp),
            colors = CardDefaults.cardColors(containerColor = Danger.tint()),
        ) {
            Row(Modifier.padding(12.dp), verticalAlignment = Alignment.CenterVertically) {
                Box(Modifier.size(40.dp).background(Danger, CircleShape), contentAlignment = Alignment.Center) {
                    Icon(Icons.Filled.Call, null, tint = Color.White)
                }
                Spacer(Modifier.width(12.dp))
                Column {
                    Text("Call ${p.callNumber}", fontWeight = FontWeight.Bold, color = Danger, fontSize = 18.sp)
                    Text(p.callWhen, fontSize = 14.sp)
                }
            }
        }
        val jumps = listOfNotNull(
            "Steps", "Do NOT".takeIf { p.doNot.isNotEmpty() }, "Equipment".takeIf { p.equipment.isNotEmpty() }, "My progress",
        )
        Row(Modifier.horizontalScroll(rememberScrollState()), horizontalArrangement = Arrangement.spacedBy(8.dp)) {
            Text("Jump to", Modifier.align(Alignment.CenterVertically), color = Color.Gray, fontSize = 13.sp)
            jumps.forEach { j ->
                AssistChip(onClick = { anchors[j]?.let { y -> scope.launch { scroll.animateScrollTo(y) } } }, label = { Text(j) })
            }
        }
        Section("Summary", "📋", color) { Text(p.summary) }
        Section("When to use", "🎯", color) { Text(p.whenToApply) }
        Section("Steps", "👣", color, Modifier.anchor("Steps")) {
            p.steps.forEach { s -> StepCard(s, color) }
        }
        if (p.doNot.isNotEmpty()) Section("Do NOT", "⛔", Danger, Modifier.anchor("Do NOT")) {
            Card(colors = CardDefaults.cardColors(containerColor = Danger.tint(0.08f))) {
                Column(Modifier.padding(12.dp)) { p.doNot.forEach { Text("✕  $it", Modifier.padding(vertical = 3.dp)) } }
            }
        }
        if (p.equipment.isNotEmpty()) Section("Equipment", "🧰", color, Modifier.anchor("Equipment")) {
            p.equipment.forEach { Text("•  $it", Modifier.padding(vertical = 2.dp)) }
        }
        Section("Source", "📚", Color.Gray) {
            Text("${p.sourceAuthority} — ${p.sourceTitle}", fontSize = 13.sp)
            p.sourceUrl?.let { Text(it, fontSize = 12.sp, color = Color.Gray) }
            p.notes?.let { Text(it, fontSize = 12.sp, color = Color.Gray, modifier = Modifier.padding(top = 4.dp)) }
        }
        HorizontalDivider(Modifier.padding(vertical = 8.dp))
        Section("Your progress", "✅", Ok, Modifier.anchor("My progress")) {
            if (progress == null) {
                Text("Not completed yet.")
                Button(onClick = { store.markCompleted(topic, age) }, colors = ButtonDefaults.buttonColors(containerColor = Ok)) {
                    Text("Mark as completed")
                }
            } else {
                Text("Completed ${progress.completed}")
                progress.reviews.forEach { Text("Reviewed $it", fontSize = 13.sp, color = Color.DarkGray) }
                Text("Next review: ${progress.nextDue}", fontWeight = FontWeight.Medium)
                Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    Button(onClick = { store.markReviewed(topic, age) }, colors = ButtonDefaults.buttonColors(containerColor = Ok)) {
                        Text("Mark as reviewed")
                    }
                    OutlinedButton(onClick = { store.clear(topic, age) }) { Text("Reset") }
                }
            }
        }
        Spacer(Modifier.height(32.dp))
    }
}

@Composable
fun StepNumber(n: Int, color: Color, size: Dp = 30.dp) {
    Box(Modifier.size(size).background(color, CircleShape), contentAlignment = Alignment.Center) {
        Text("$n", color = Color.White, fontWeight = FontWeight.Bold, fontSize = (size.value * 0.5f).sp)
    }
}

@Composable
fun StepCard(s: Step, color: Color) {
    Card(Modifier.fillMaxWidth().padding(vertical = 4.dp), colors = CardDefaults.cardColors(containerColor = color.tint(0.06f))) {
        Row(Modifier.padding(12.dp)) {
            StepNumber(s.number, color)
            Spacer(Modifier.width(12.dp))
            Column(Modifier.weight(1f)) {
                Text(s.instruction, fontWeight = FontWeight.SemiBold)
                s.detail?.let { Text(it, fontSize = 14.sp, color = Color.DarkGray, modifier = Modifier.padding(top = 4.dp)) }
                s.warning?.let { WarningBox(it) }
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
}

@Composable
fun WarningBox(text: String, fontSize: Int = 14) {
    Text(
        "⚠  $text", fontSize = fontSize.sp, color = Color(0xFF8A3B00),
        modifier = Modifier.padding(top = 6.dp).fillMaxWidth().background(Warn.tint(0.15f), RoundedCornerShape(6.dp)).padding(8.dp),
    )
}

private val STEP_REF = Regex("""[Ss]tep\s+(\d+)""")

// The protocol as an interactive flowchart: one step on screen at a time, and at
// each decision point the answer chosen decides where to go next. Outcomes that
// name a step ("Proceed to Step 7") become a jump to that step.
@Composable
fun WalkthroughScreen(c: Content, topic: String, age: Age) {
    val p = c.protocol(topic, age) ?: return
    val color = topicColor(c, topic)
    var index by rememberSaveable { mutableIntStateOf(0) }
    var answer by remember { mutableStateOf<Boolean?>(null) }
    val history = remember { mutableStateListOf<Int>() }
    val step = p.steps.getOrNull(index)

    fun goTo(i: Int) { history.add(index); index = i; answer = null }

    Column(Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(16.dp)) {
        LinearProgressIndicator(
            progress = { (index + 1f) / p.steps.size }, Modifier.fillMaxWidth().height(8.dp),
            color = color, trackColor = color.tint(0.2f),
        )
        Text("${age.label} · step ${minOf(index + 1, p.steps.size)} of ${p.steps.size}", color = Color.Gray, fontSize = 13.sp,
            modifier = Modifier.padding(top = 6.dp))
        Spacer(Modifier.height(12.dp))
        if (step == null) {
            Text("✅ End of protocol", fontSize = 24.sp, fontWeight = FontWeight.Bold)
            Text("Keep monitoring the person and stay on the line with 101 until help arrives.", Modifier.padding(vertical = 8.dp))
            Button(onClick = { history.clear(); index = 0; answer = null }) { Text("Start again") }
            return@Column
        }
        Row(verticalAlignment = Alignment.Top) {
            StepNumber(step.number, color, 40.dp)
            Spacer(Modifier.width(12.dp))
            Text(step.instruction, Modifier.weight(1f), fontSize = 24.sp, fontWeight = FontWeight.Bold, lineHeight = 30.sp)
        }
        step.detail?.let { Text(it, fontSize = 17.sp, modifier = Modifier.padding(top = 10.dp)) }
        step.warning?.let { WarningBox(it, 16) }
        Spacer(Modifier.height(16.dp))
        val d = step.decision
        if (d != null) {
            Text(d.condition, fontSize = 20.sp, fontWeight = FontWeight.SemiBold)
            Row(Modifier.fillMaxWidth().padding(vertical = 10.dp), horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                Button(onClick = { answer = true }, Modifier.weight(1f).height(72.dp),
                    colors = ButtonDefaults.buttonColors(containerColor = Ok)) {
                    Icon(Icons.Filled.Check, null); Spacer(Modifier.width(6.dp)); Text("YES", fontSize = 22.sp, fontWeight = FontWeight.Bold)
                }
                Button(onClick = { answer = false }, Modifier.weight(1f).height(72.dp),
                    colors = ButtonDefaults.buttonColors(containerColor = Danger)) {
                    Icon(Icons.Filled.Close, null); Spacer(Modifier.width(6.dp)); Text("NO", fontSize = 22.sp, fontWeight = FontWeight.Bold)
                }
            }
            answer?.let { yes ->
                val outcome = if (yes) d.ifYes else d.ifNo
                Card(colors = CardDefaults.cardColors(containerColor = if (yes) Ok.tint() else Danger.tint())) {
                    Text(outcome, Modifier.padding(12.dp), fontSize = 17.sp)
                }
                val target = STEP_REF.find(outcome)?.groupValues?.get(1)?.toIntOrNull()
                    ?.let { n -> p.steps.indexOfFirst { it.number == n } }?.takeIf { it >= 0 }
                Spacer(Modifier.height(10.dp))
                if (target != null && target != index + 1) {
                    Button(onClick = { goTo(target) }, Modifier.fillMaxWidth().height(56.dp),
                        colors = ButtonDefaults.buttonColors(containerColor = color)) { Text("Go to step ${p.steps[target].number}", fontSize = 18.sp) }
                }
                OutlinedButton(onClick = { goTo(index + 1) }, Modifier.fillMaxWidth().height(52.dp)) { Text("Next step", fontSize = 17.sp) }
            }
        } else {
            Button(onClick = { goTo(index + 1) }, Modifier.fillMaxWidth().height(60.dp),
                colors = ButtonDefaults.buttonColors(containerColor = color)) {
                Icon(Icons.Filled.Check, null); Spacer(Modifier.width(8.dp)); Text("Done — next step", fontSize = 18.sp, fontWeight = FontWeight.Bold)
            }
        }
        if (history.isNotEmpty()) {
            TextButton(onClick = { index = history.removeAt(history.lastIndex); answer = null }) { Text("‹ Previous step") }
        }
    }
}

// ---- Review ----

@Composable
fun ReviewScreen(c: Content, store: ReviewStore, go: (Screen) -> Unit) {
    val units = c.allTopics.flatMap { t -> Age.entries.map { t to it } }
    val done = units.count { (t, a) -> store.get(t, a) != null }
    val due = units.mapNotNull { (t, a) -> store.get(t, a)?.let { Triple(t, a, it) } }
        .sortedBy { it.third.nextDue }
    var confirm by remember { mutableStateOf(false) }
    LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp)) {
        item {
            Card(Modifier.fillMaxWidth().padding(top = 12.dp), colors = CardDefaults.cardColors(containerColor = Ok.tint())) {
                Column(Modifier.padding(16.dp)) {
                    Text("Progress: $done of ${units.size} completed", fontSize = 18.sp, fontWeight = FontWeight.Bold, color = Ok)
                    LinearProgressIndicator(progress = { done.toFloat() / units.size }, Modifier.fillMaxWidth().padding(vertical = 8.dp).height(10.dp),
                        color = Ok, trackColor = Ok.tint(0.25f))
                    Text("Each topic is learned once per age group, then reviewed after 1 week, 1 month, 3 months, 6 months and yearly.", fontSize = 13.sp, color = Color.DarkGray)
                }
            }
            SectionLabel("Schedule")
            if (due.isEmpty()) Text("Nothing completed yet. Open a topic and mark it completed to start.", Modifier.padding(vertical = 8.dp))
        }
        items(due) { (t, a, p) ->
            val overdue = p.daysUntilDue() <= 0
            Card(
                onClick = { go(Screen.Topic(t, a)) }, Modifier.fillMaxWidth().padding(vertical = 3.dp),
                colors = CardDefaults.cardColors(containerColor = if (overdue) Warn.tint() else Color.White),
                border = BorderStroke(1.dp, (if (overdue) Warn else Ok).copy(alpha = 0.4f)),
            ) {
                Row(Modifier.padding(10.dp), verticalAlignment = Alignment.CenterVertically) {
                    IconBubble(c.icon(t), topicColor(c, t), 40.dp)
                    Spacer(Modifier.width(10.dp))
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
                Button(onClick = { store.resetAll(); confirm = false },
                    colors = ButtonDefaults.buttonColors(containerColor = Danger)) { Text("Erase") }
                TextButton(onClick = { confirm = false }) { Text("Cancel") }
            }
            Spacer(Modifier.height(24.dp))
        }
    }
}

// ---- Numbers ----

@Composable
fun ContactsScreen(c: Content) {
    val ctx = LocalContext.current
    LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp)) {
        for (g in c.contacts) {
            item { SectionLabel(g.title, Teal) }
            items(g.items) { ct ->
                val color = if (ct.primary) Danger else Teal
                Card(
                    onClick = { ctx.dial(ct.number) }, Modifier.fillMaxWidth().padding(vertical = 3.dp),
                    colors = CardDefaults.cardColors(containerColor = if (ct.primary) Danger.tint() else Color.White),
                    border = BorderStroke(1.dp, color.copy(alpha = 0.35f)),
                ) {
                    Row(Modifier.padding(12.dp), verticalAlignment = Alignment.CenterVertically) {
                        Box(Modifier.size(40.dp).background(color, CircleShape), contentAlignment = Alignment.Center) {
                            Icon(Icons.Filled.Call, null, tint = Color.White, modifier = Modifier.size(20.dp))
                        }
                        Spacer(Modifier.width(12.dp))
                        Column(Modifier.weight(1f)) {
                            Text(ct.name, fontWeight = FontWeight.Medium)
                            ct.note?.let { Text(it, fontSize = 12.sp, color = Color.DarkGray) }
                        }
                        Text(ct.number, fontWeight = FontWeight.Bold, color = color)
                    }
                }
            }
        }
        item { Text("Numbers verified ${c.contactsVerified}. Check before relying on them.", fontSize = 12.sp, color = Color.Gray, modifier = Modifier.padding(vertical = 16.dp)) }
    }
}

// ---- About / disclaimer ----

const val DISCLAIMER = "This app is a personal study and reference aid. It is not an official Magen David Adom, " +
    "United Hatzalah or Ministry of Health product, and it is not medical advice. It does not replace first aid " +
    "training. Guidelines change; verify against the source organisation. In an emergency, call 101 first."

@Composable
fun AboutScreen() {
    Column(Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(16.dp)) {
        Image(painterResource(R.drawable.ic_star_of_david), null, Modifier.size(56.dp))
        Spacer(Modifier.height(12.dp))
        Text(DISCLAIMER)
        Spacer(Modifier.height(12.dp))
        Text("Content: 28 topics × adult and child protocols, compiled from MDA and United Hatzalah public guidance, with international (e.g. American Red Cross / AHA) guidance where Israeli guidance was silent. Each protocol lists its source.")
        Spacer(Modifier.height(12.dp))
        Text("Everything runs offline. Review progress is stored only on this device.")
        Spacer(Modifier.height(12.dp))
        val ctx = LocalContext.current
        val version = runCatching { ctx.packageManager.getPackageInfo(ctx.packageName, 0).versionName }.getOrNull()
        Text("Version ${version ?: "?"}", color = Color.Gray)
    }
}

@Composable
fun DisclaimerScreen(onAccept: () -> Unit) {
    Column(Modifier.fillMaxSize().statusBarsPadding().padding(24.dp), verticalArrangement = Arrangement.Center) {
        Image(painterResource(R.drawable.ic_star_of_david), null, Modifier.size(64.dp))
        Spacer(Modifier.height(16.dp))
        Text("Before you start", fontSize = 26.sp, fontWeight = FontWeight.Bold)
        Spacer(Modifier.height(12.dp))
        Text(DISCLAIMER, fontSize = 17.sp)
        Spacer(Modifier.height(24.dp))
        Button(onClick = onAccept, Modifier.fillMaxWidth().height(56.dp)) { Text("I understand", fontSize = 18.sp) }
        Text("Emergency: 101", Modifier.fillMaxWidth().padding(top = 16.dp), textAlign = TextAlign.Center, color = Danger, fontWeight = FontWeight.Bold)
    }
}
