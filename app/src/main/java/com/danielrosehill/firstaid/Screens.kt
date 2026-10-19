@file:OptIn(ExperimentalMaterial3Api::class)

package com.danielrosehill.firstaid

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.KeyboardArrowRight
import androidx.compose.material.icons.filled.Call
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.KeyboardArrowDown
import androidx.compose.material.icons.filled.KeyboardArrowUp
import androidx.compose.material.icons.filled.LocationOn
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.Warning
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.onPlaced
import androidx.compose.ui.layout.positionInParent
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontStyle
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

// An accordion row for material you rarely need in the moment (sources,
// equipment, progress). Closed by default; the header says what is inside.
@Composable
fun Collapsible(
    title: String, icon: String, color: Color, hint: String? = null, modifier: Modifier = Modifier,
    body: @Composable ColumnScope.() -> Unit,
) {
    var open by rememberSaveable { mutableStateOf(false) }
    Column(modifier.fillMaxWidth().padding(vertical = 4.dp)) {
        Row(
            Modifier.fillMaxWidth().clip(RoundedCornerShape(10.dp)).background(color.tint(0.07f))
                .clickable { open = !open }.padding(horizontal = 12.dp, vertical = 12.dp),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            Text(icon, fontSize = 18.sp)
            Spacer(Modifier.width(8.dp))
            Column(Modifier.weight(1f)) {
                Text(title, fontWeight = FontWeight.Bold, color = color, fontSize = 16.sp)
                if (!open) hint?.let { Text(it, fontSize = 12.sp, color = Color.Gray, maxLines = 1) }
            }
            Icon(if (open) Icons.Filled.KeyboardArrowUp else Icons.Filled.KeyboardArrowDown, if (open) "Collapse" else "Expand", tint = color)
        }
        if (open) Column(Modifier.padding(start = 8.dp, end = 4.dp, top = 8.dp)) { body() }
    }
}

// Pinned row of chips above a long page; each jumps to one section.
@Composable
fun JumpBar(targets: List<Pair<String, Color>>, onJump: (Int) -> Unit) {
    if (targets.size < 2) return
    Row(
        Modifier.fillMaxWidth().background(Color.White).horizontalScroll(rememberScrollState())
            .padding(horizontal = 12.dp, vertical = 2.dp),
        horizontalArrangement = Arrangement.spacedBy(6.dp), verticalAlignment = Alignment.CenterVertically,
    ) {
        Text("Jump to", color = Color.Gray, fontSize = 12.sp)
        targets.forEachIndexed { i, (label, color) ->
            AssistChip(onClick = { onJump(i) }, label = { Text(label, color = color, fontWeight = FontWeight.Medium, maxLines = 1) },
                border = BorderStroke(1.dp, color.copy(alpha = 0.4f)))
        }
    }
    HorizontalDivider()
}

// Index of each section header in a LazyColumn laid out as `lead` items, then
// for each section one header item followed by its rows.
fun headerIndices(lead: Int, sizes: List<Int>): List<Int> = sizes.runningFold(lead) { acc, n -> acc + 1 + n }.dropLast(1)

// A big tappable row used by hub screens (Resources) and the home shortcuts.
@Composable
fun HubCard(icon: String, title: String, subtitle: String?, color: Color, onClick: () -> Unit) {
    Card(
        onClick = onClick, Modifier.fillMaxWidth().padding(vertical = 4.dp),
        colors = CardDefaults.cardColors(containerColor = Color.White),
        border = BorderStroke(1.dp, color.copy(alpha = 0.35f)),
    ) {
        Row(Modifier.padding(12.dp), verticalAlignment = Alignment.CenterVertically) {
            IconBubble(icon, color)
            Spacer(Modifier.width(12.dp))
            Column(Modifier.weight(1f)) {
                Text(title, fontSize = 17.sp, fontWeight = FontWeight.Bold, color = color)
                subtitle?.let { Text(it, fontSize = 13.sp, color = Color.DarkGray) }
            }
            Icon(Icons.AutoMirrored.Filled.KeyboardArrowRight, null, tint = color)
        }
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
        SectionLabel("Quick reference")
        listOf(
            Triple("🔀", "Flowcharts", Screen.Flowcharts), Triple("📞", "Numbers", Screen.Contacts),
            Triple("🏥", "Terem", Screen.Terem), Triple("🗣️", "Hebrew", Screen.Glossary),
        ).chunked(2).forEach { row ->
            Row(Modifier.fillMaxWidth().padding(vertical = 4.dp), horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                row.forEach { (icon, label, target) ->
                    OutlinedCard(onClick = { go(target) }, Modifier.weight(1f).height(56.dp)) {
                        Row(Modifier.fillMaxSize().padding(horizontal = 12.dp), verticalAlignment = Alignment.CenterVertically) {
                            Text(icon, fontSize = 22.sp)
                            Spacer(Modifier.width(10.dp))
                            Text(label, fontWeight = FontWeight.Bold, fontSize = 15.sp)
                        }
                    }
                }
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
    val shown = c.groups.map { g ->
        g to g.topics.filter { t ->
            q.isEmpty() || c.name(t).lowercase().contains(q) ||
                Age.entries.any { c.protocol(t, it)?.let { p -> p.summary.lowercase().contains(q) || p.title.lowercase().contains(q) } == true }
        }
    }.filter { it.second.isNotEmpty() }
    val list = rememberLazyListState()
    val scope = rememberCoroutineScope()
    val heads = headerIndices(1, shown.map { it.second.size })
    Column(Modifier.fillMaxSize()) {
        JumpBar(shown.map { (g, _) -> g.title to (g.color?.let { Color(it) } ?: Blue) }) { scope.launch { list.animateScrollToItem(heads[it]) } }
        LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp), state = list) {
            item {
                OutlinedTextField(query, { query = it }, Modifier.fillMaxWidth().padding(vertical = 8.dp),
                    placeholder = { Text("Search topics") }, singleLine = true,
                    leadingIcon = { Icon(Icons.Filled.Search, null) })
            }
            for ((g, topics) in shown) {
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

    val jumps = listOfNotNull("Steps" to color, ("Do NOT" to Danger).takeIf { p.doNot.isNotEmpty() }, "More info" to Slate)
    val anchorOf = listOfNotNull("Steps", "Do NOT".takeIf { p.doNot.isNotEmpty() }, "More")
    Column(Modifier.fillMaxSize()) {
        JumpBar(listOf("Top" to color) + jumps) { i ->
            val y = if (i == 0) 0 else anchors[anchorOf[i - 1]] ?: return@JumpBar
            scope.launch { scroll.animateScrollTo(y) }
        }
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
            OutlinedButton(onClick = { go(Screen.Flowchart(topic, age)) }, Modifier.fillMaxWidth().padding(top = 6.dp).height(48.dp)) {
                Text("🔀  See the whole flowchart", fontSize = 16.sp)
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
            // Below this line: reference material, folded away so the steps stay in view.
            HorizontalDivider(Modifier.padding(vertical = 8.dp).anchor("More"))
            if (p.equipment.isNotEmpty()) Collapsible("Equipment", "🧰", color, "${p.equipment.size} items") {
                p.equipment.forEach { Text("•  $it", Modifier.padding(vertical = 2.dp)) }
            }
            Collapsible("Source", "📚", Slate, p.sourceAuthority) {
                Text("${p.sourceAuthority} — ${p.sourceTitle}", fontSize = 13.sp)
                p.sourceUrl?.let { Text(it, fontSize = 12.sp, color = Color.Gray) }
                p.notes?.let { Text(it, fontSize = 12.sp, color = Color.Gray, modifier = Modifier.padding(top = 4.dp)) }
            }
            Collapsible(
                "Your progress", "✅", Ok,
                when { progress == null -> "Not completed yet"; else -> "Next review ${progress.nextDue}" },
            ) {
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
fun ContactsScreen(c: Content, go: (Screen) -> Unit) {
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
        item {
            Spacer(Modifier.height(8.dp))
            HubCard("🏥", "Terem branches", "Addresses, opening hours and websites", Purple) { go(Screen.Terem) }
        }
        item { Text("Numbers verified ${c.contactsVerified}. Check before relying on them.", fontSize = 12.sp, color = Color.Gray, modifier = Modifier.padding(vertical = 16.dp)) }
    }
}

// ---- Flowcharts ----

// Every protocol's decision forks, one tap from the bottom bar, without going
// through a topic page first.
@Composable
fun FlowchartsScreen(c: Content, age: Age, setAge: (Age) -> Unit, go: (Screen) -> Unit) {
    val list = rememberLazyListState()
    val scope = rememberCoroutineScope()
    val heads = headerIndices(1, c.groups.map { it.topics.size })
    Column(Modifier.fillMaxSize()) {
        JumpBar(c.groups.map { g -> g.title to (g.color?.let { Color(it) } ?: Blue) }) { scope.launch { list.animateScrollToItem(heads[it]) } }
        LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp), state = list) {
            item {
                Spacer(Modifier.height(10.dp))
                HubCard("🧭", "What's happening? — full map", "Every branch of the emergency guide on one page", Danger) { go(Screen.TriageMap) }
                AgeToggle(age, setAge)
            }
            for (g in c.groups) {
                val color = g.color?.let { Color(it) } ?: Blue
                item { SectionLabel(g.title, color) }
                items(g.topics) { t ->
                    val p = c.protocol(t, age)
                    val forks = p?.steps?.count { it.decision != null } ?: 0
                    Card(
                        onClick = { go(Screen.Flowchart(t, age)) }, Modifier.fillMaxWidth().padding(vertical = 3.dp),
                        colors = CardDefaults.cardColors(containerColor = Color.White),
                        border = BorderStroke(1.dp, color.copy(alpha = 0.3f)),
                    ) {
                        Row(Modifier.padding(10.dp), verticalAlignment = Alignment.CenterVertically) {
                            IconBubble(c.icon(t), color, 40.dp)
                            Spacer(Modifier.width(12.dp))
                            Column(Modifier.weight(1f)) {
                                Text(c.name(t), fontSize = 16.sp, fontWeight = FontWeight.Medium)
                                Text("${p?.steps?.size ?: 0} steps · $forks decision${if (forks == 1) "" else "s"}", fontSize = 12.sp, color = Color.Gray)
                            }
                            Icon(Icons.AutoMirrored.Filled.KeyboardArrowRight, null, tint = color)
                        }
                    }
                }
            }
            item { Spacer(Modifier.height(24.dp)) }
        }
    }
}

// One protocol drawn as a chart: steps top to bottom, each decision a fork with
// its YES and NO outcomes. An outcome that names a step jumps to it. Tap a step
// for its detail.
@Composable
fun FlowchartScreen(c: Content, topic: String, age: Age, go: (Screen) -> Unit, setAge: (Age) -> Unit) {
    val p = c.protocol(topic, age) ?: return Text("No protocol for this age group.", Modifier.padding(16.dp))
    val color = topicColor(c, topic)
    val scroll = rememberScrollState()
    val scope = rememberCoroutineScope()
    val anchors = remember { mutableStateMapOf<Int, Int>() }
    val jump: (Int) -> Unit = { n -> anchors[n]?.let { y -> scope.launch { scroll.animateScrollTo(y) } } }

    Column(Modifier.fillMaxSize()) {
        JumpBar(p.steps.map { (if (it.decision != null) "◆ " else "") + it.number to (if (it.decision != null) color else Slate) }) { jump(p.steps[it].number) }
        Column(Modifier.fillMaxSize().verticalScroll(scroll).padding(horizontal = 16.dp)) {
            AgeToggle(age, setAge)
            Button(
                onClick = { go(Screen.Walkthrough(topic, age)) }, Modifier.fillMaxWidth().height(52.dp),
                colors = ButtonDefaults.buttonColors(containerColor = Danger),
            ) {
                Icon(Icons.Filled.PlayArrow, null); Spacer(Modifier.width(8.dp)); Text("Walk me through it", fontSize = 17.sp, fontWeight = FontWeight.Bold)
            }
            Text("◆ = decision. Tap a step for details, tap “→ Step N” to jump.", fontSize = 12.sp, color = Color.Gray,
                modifier = Modifier.padding(vertical = 8.dp))
            p.steps.forEachIndexed { i, s ->
                FlowNode(s, color, p.steps.map { it.number }.toSet(), jump,
                    Modifier.onPlaced { anchors[s.number] = it.positionInParent().y.toInt() })
                if (i < p.steps.lastIndex) Text("↓", Modifier.fillMaxWidth(), color = color, fontSize = 22.sp, textAlign = TextAlign.Center)
            }
            Text("↓", Modifier.fillMaxWidth(), color = Ok, fontSize = 22.sp, textAlign = TextAlign.Center)
            Card(colors = CardDefaults.cardColors(containerColor = Ok.tint()), modifier = Modifier.fillMaxWidth()) {
                Text("✅  Keep monitoring. Stay on the line with ${p.callNumber} until help arrives.", Modifier.padding(12.dp), fontWeight = FontWeight.Medium)
            }
            Spacer(Modifier.height(32.dp))
        }
    }
}

@Composable
fun FlowNode(s: Step, color: Color, steps: Set<Int>, jump: (Int) -> Unit, modifier: Modifier) {
    var open by rememberSaveable(s.number) { mutableStateOf(false) }
    val hasMore = s.detail != null || s.warning != null
    Card(
        modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(containerColor = Color.White),
        border = BorderStroke(if (s.decision != null) 2.dp else 1.dp, color.copy(alpha = if (s.decision != null) 0.8f else 0.35f)),
    ) {
        Column(Modifier.then(if (hasMore) Modifier.clickable { open = !open } else Modifier).padding(12.dp)) {
            Row(verticalAlignment = Alignment.Top) {
                StepNumber(s.number, color, 28.dp)
                Spacer(Modifier.width(10.dp))
                Text(s.instruction, Modifier.weight(1f), fontWeight = FontWeight.SemiBold)
                if (hasMore) Icon(if (open) Icons.Filled.KeyboardArrowUp else Icons.Filled.KeyboardArrowDown, null, tint = Color.Gray)
            }
            if (open) {
                s.detail?.let { Text(it, fontSize = 14.sp, color = Color.DarkGray, modifier = Modifier.padding(top = 6.dp)) }
                s.warning?.let { WarningBox(it) }
            }
            s.decision?.let { d ->
                Text("◆  ${d.condition}", Modifier.padding(top = 10.dp).fillMaxWidth()
                    .background(color.tint(0.12f), RoundedCornerShape(6.dp)).padding(8.dp), fontWeight = FontWeight.Bold)
                Branch("YES", d.ifYes, Ok, steps, jump)
                Branch("NO", d.ifNo, Danger, steps, jump)
            }
        }
    }
}

@Composable
private fun Branch(label: String, outcome: String, color: Color, steps: Set<Int>, jump: (Int) -> Unit) {
    val target = STEP_REF.find(outcome)?.groupValues?.get(1)?.toIntOrNull()?.takeIf { it in steps }
    Row(Modifier.padding(top = 6.dp).height(IntrinsicSize.Min)) {
        Box(Modifier.width(4.dp).fillMaxHeight().background(color, RoundedCornerShape(2.dp)))
        Column(Modifier.padding(start = 8.dp).weight(1f)) {
            Text(label, color = color, fontWeight = FontWeight.Bold, fontSize = 13.sp)
            Text(outcome, fontSize = 14.sp)
            target?.let { n ->
                Text("→ Step $n", color = color, fontWeight = FontWeight.Bold,
                    modifier = Modifier.clip(RoundedCornerShape(6.dp)).clickable { jump(n) }.padding(vertical = 6.dp, horizontal = 2.dp))
            }
        }
    }
}

// The whole "What's happening?" tree as an outline, so every fork is visible at
// once. Answers that open a protocol or dial are live.
@Composable
fun TriageMapScreen(c: Content, age: Age, setAge: (Age) -> Unit, go: (Screen) -> Unit) {
    Column(Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(horizontal = 16.dp)) {
        Text("Every branch of the emergency guide. Tap an answer that names a topic to open it.",
            color = Color.DarkGray, fontSize = 14.sp, modifier = Modifier.padding(top = 10.dp))
        AgeToggle(age, setAge)
        TriageBranch(c, c.triageRoot, emptySet(), age, go)
        Spacer(Modifier.height(32.dp))
    }
}

@Composable
fun TriageBranch(c: Content, id: String, seen: Set<String>, age: Age, go: (Screen) -> Unit) {
    val ctx = LocalContext.current
    val node = c.triage[id] ?: return
    Text(node.question, fontWeight = FontWeight.Bold, fontSize = 17.sp, modifier = Modifier.padding(top = 8.dp, bottom = 4.dp))
    node.answers.forEach { a ->
        val act = a.action
        val solid = when (a.emphasis) { "danger" -> Danger; "warn" -> Warn; "ok" -> Ok; else -> null }
        val color = solid ?: (act as? TriageAction.OpenTopic)?.let { topicColor(c, it.topic) } ?: Slate
        Row(Modifier.padding(vertical = 3.dp).height(IntrinsicSize.Min)) {
            Box(Modifier.width(3.dp).fillMaxHeight().background(color.copy(alpha = 0.6f), RoundedCornerShape(2.dp)))
            Column(Modifier.padding(start = 10.dp).weight(1f)) {
                when (act) {
                    is TriageAction.Goto -> {
                        Text("${a.icon ?: "❓"}  ${a.label}", fontWeight = FontWeight.SemiBold, color = color)
                        if (act.node in seen || act.node == id) Text("↑ see above", fontSize = 12.sp, color = Color.Gray)
                        else TriageBranch(c, act.node, seen + id, age, go)
                    }
                    is TriageAction.OpenTopic -> Text(
                        "${c.icon(act.topic)}  ${a.label}  →  ${c.name(act.topic)}", color = color, fontWeight = FontWeight.Medium,
                        modifier = Modifier.fillMaxWidth().clip(RoundedCornerShape(6.dp)).background(color.tint(0.08f))
                            .clickable { go(Screen.Topic(act.topic, age)) }.padding(10.dp),
                    )
                    is TriageAction.Call -> Text(
                        "📞  ${a.label}  →  call ${act.number}", color = Danger, fontWeight = FontWeight.Bold,
                        modifier = Modifier.fillMaxWidth().clip(RoundedCornerShape(6.dp)).background(Danger.tint(0.08f))
                            .clickable { ctx.dial(act.number) }.padding(10.dp),
                    )
                }
            }
        }
    }
}

// ---- Resources ----

@Composable
fun ResourcesScreen(c: Content, store: ReviewStore, go: (Screen) -> Unit) {
    val due = store.all().values.count { it.daysUntilDue() <= 0 }
    val branches = c.terem.regions.sumOf { it.branches.size }
    val words = c.glossary.sumOf { it.items.size }
    Column(Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(16.dp)) {
        SectionLabel("Quick reference", Teal)
        HubCard("📞", "Phone numbers", "MDA, Hatzalah, police, poison centre, Terem, Kupat Holim", Teal) { go(Screen.Contacts) }
        HubCard("🏥", "Terem urgent care", "$branches branches: addresses, hours, websites", Purple) { go(Screen.Terem) }
        HubCard("🗣️", "Hebrew glossary", "$words words and phrases, with audio", Blue) { go(Screen.Glossary) }
        SectionLabel("Learning", Teal)
        HubCard("📅", "Review schedule", if (due > 0) "$due topic(s) due for review" else "Spaced review progress", if (due > 0) Warn else Ok) { go(Screen.Review) }
        HubCard("ℹ️", "About and disclaimer", null, Slate) { go(Screen.About) }
    }
}

@Composable
fun TeremScreen(c: Content) {
    val ctx = LocalContext.current
    val t = c.terem
    val list = rememberLazyListState()
    val scope = rememberCoroutineScope()
    val heads = headerIndices(1, t.regions.map { it.branches.size })
    Column(Modifier.fillMaxSize()) {
        JumpBar(t.regions.map { it.title to Purple }) { scope.launch { list.animateScrollToItem(heads[it]) } }
        LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp), state = list) {
            item {
                Card(
                    onClick = { ctx.dial(t.phone) }, Modifier.fillMaxWidth().padding(top = 12.dp),
                    colors = CardDefaults.cardColors(containerColor = Purple.tint()),
                ) {
                    Row(Modifier.padding(12.dp), verticalAlignment = Alignment.CenterVertically) {
                        Box(Modifier.size(40.dp).background(Purple, CircleShape), contentAlignment = Alignment.Center) {
                            Icon(Icons.Filled.Call, null, tint = Color.White)
                        }
                        Spacer(Modifier.width(12.dp))
                        Column(Modifier.weight(1f)) {
                            Text("Terem national line", fontWeight = FontWeight.Bold, color = Purple)
                            Text("Branches have no numbers of their own", fontSize = 12.sp, color = Color.DarkGray)
                        }
                        Text(t.phone, fontWeight = FontWeight.Bold, color = Purple)
                    }
                }
                TextButton(onClick = { ctx.view(t.site) }) { Text("terem.com ↗") }
                Text("Urgent care, not emergencies. For anything life-threatening call 101. Hours change on holidays: check the branch page.",
                    fontSize = 13.sp, color = Color.DarkGray)
            }
            for (r in t.regions) {
                item { SectionLabel(r.title, Purple) }
                items(r.branches) { b -> TeremCard(b) }
            }
            item { Text("Branch list checked against terem.com on ${t.verified}.", fontSize = 12.sp, color = Color.Gray, modifier = Modifier.padding(vertical = 16.dp)) }
        }
    }
}

@Composable
fun TeremCard(b: TeremBranch) {
    val ctx = LocalContext.current
    Card(
        Modifier.fillMaxWidth().padding(vertical = 3.dp),
        colors = CardDefaults.cardColors(containerColor = Color.White),
        border = BorderStroke(1.dp, Purple.copy(alpha = 0.3f)),
    ) {
        Column(Modifier.padding(start = 12.dp, end = 12.dp, top = 10.dp)) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Text(b.name, Modifier.weight(1f), fontWeight = FontWeight.Bold, fontSize = 16.sp)
                Text(b.he, fontSize = 13.sp, color = Color.Gray)
            }
            Text("${b.address}, ${b.city}", fontSize = 14.sp)
            Text("🕒  ${b.hours}", fontSize = 13.sp, color = if (b.hours == "24/7") Ok else Color.DarkGray,
                fontWeight = if (b.hours == "24/7") FontWeight.Bold else FontWeight.Normal)
            Row {
                TextButton(onClick = { ctx.view(b.url) }) { Text("Branch page ↗") }
                TextButton(onClick = { ctx.view("geo:0,0?q=" + android.net.Uri.encode("Terem ${b.address}, ${b.city}")) }) {
                    Icon(Icons.Filled.LocationOn, null, Modifier.size(18.dp)); Text(" Map")
                }
            }
        }
    }
}

// One clip at a time; a new tap stops the previous one.
class ClipPlayer(private val ctx: android.content.Context) {
    private var mp: android.media.MediaPlayer? = null
    fun play(id: String) {
        stop()
        val afd = runCatching { ctx.assets.openFd("glossary/$id.mp3") }.getOrNull() ?: return
        mp = android.media.MediaPlayer().apply {
            afd.use { setDataSource(it.fileDescriptor, it.startOffset, it.length) }
            setOnCompletionListener { p -> p.release(); if (mp === p) mp = null }
            prepare(); start()
        }
    }
    fun stop() { mp?.release(); mp = null }
}

@Composable
fun GlossaryScreen(c: Content) {
    val ctx = LocalContext.current
    val player = remember { ClipPlayer(ctx) }
    DisposableEffect(Unit) { onDispose { player.stop() } }
    var query by rememberSaveable { mutableStateOf("") }
    val q = query.trim().lowercase()
    val shown = c.glossary.map { g ->
        g to g.items.filter { q.isEmpty() || it.en.lowercase().contains(q) || it.he.contains(q) || it.translit.lowercase().contains(q) }
    }.filter { it.second.isNotEmpty() }
    val list = rememberLazyListState()
    val scope = rememberCoroutineScope()
    val heads = headerIndices(1, shown.map { it.second.size })
    Column(Modifier.fillMaxSize()) {
        JumpBar(shown.map { it.first.title to Blue }) { scope.launch { list.animateScrollToItem(heads[it]) } }
        LazyColumn(Modifier.fillMaxSize().padding(horizontal = 16.dp), state = list) {
            item {
                OutlinedTextField(query, { query = it }, Modifier.fillMaxWidth().padding(vertical = 8.dp),
                    placeholder = { Text("Search English or Hebrew") }, singleLine = true,
                    leadingIcon = { Icon(Icons.Filled.Search, null) })
                Text("Tap a word to hear it. m / f = said to a man / a woman. Audio is a synthetic voice.", fontSize = 12.sp, color = Color.Gray)
            }
            for ((g, hits) in shown) {
                item { SectionLabel(g.title, Blue) }
                items(hits) { w ->
                    Card(
                        onClick = { player.play(w.id) }, Modifier.fillMaxWidth().padding(vertical = 3.dp),
                        colors = CardDefaults.cardColors(containerColor = Color.White),
                        border = BorderStroke(1.dp, Blue.copy(alpha = 0.25f)),
                    ) {
                        Row(Modifier.padding(12.dp), verticalAlignment = Alignment.CenterVertically) {
                            Column(Modifier.weight(1f)) {
                                Text(w.en, fontSize = 14.sp, color = Color.DarkGray)
                                Text(w.he, fontSize = 22.sp, fontWeight = FontWeight.Bold)
                                Text(w.translit, fontSize = 14.sp, color = Blue, fontStyle = FontStyle.Italic)
                            }
                            Box(Modifier.size(44.dp).background(Blue, CircleShape), contentAlignment = Alignment.Center) {
                                Icon(Icons.Filled.PlayArrow, "Play", tint = Color.White)
                            }
                        }
                    }
                }
            }
            item { Spacer(Modifier.height(24.dp)) }
        }
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
