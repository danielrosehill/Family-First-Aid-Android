@file:OptIn(ExperimentalMaterial3Api::class)

package com.danielrosehill.firstaid

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.net.Uri
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.BackHandler
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.List
import androidx.compose.material.icons.filled.Call
import androidx.compose.material.icons.filled.DateRange
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.Phone
import androidx.compose.material.icons.filled.Warning
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveableStateHolder
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.compositeOver
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalView
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.core.view.WindowCompat

sealed class Screen {
    data object Home : Screen()
    // via: the answer that led here, shown as this node's breadcrumb.
    data class Triage(val node: String, val via: String? = null) : Screen()
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
val Blue = Color(0xFF1E40AF)
val Slate = Color(0xFF37474F)
val Teal = Color(0xFF00695C)

// An opaque pale version of a colour, for card and strip backgrounds.
fun Color.tint(amount: Float = 0.12f) = copy(alpha = amount).compositeOver(Color.White)

// The sections in the bottom bar. Each one's colour also tints its top bar and
// breadcrumbs, so the colour tells you where you are.
enum class Tab(val label: String, val icon: ImageVector, val color: Color) {
    HOME("Home", Icons.Filled.Home, Slate),
    GUIDE("Help now", Icons.Filled.Warning, Danger),
    TOPICS("Topics", Icons.AutoMirrored.Filled.List, Blue),
    REVIEW("Review", Icons.Filled.DateRange, Ok),
    NUMBERS("Numbers", Icons.Filled.Phone, Teal),
}

fun tabOf(s: Screen?) = when (s) {
    is Screen.Triage -> Tab.GUIDE
    Screen.Topics, is Screen.Topic, is Screen.Walkthrough -> Tab.TOPICS
    Screen.Review -> Tab.REVIEW
    Screen.Contacts -> Tab.NUMBERS
    else -> Tab.HOME
}

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        val content = Content.load(this)
        val store = ReviewStore(this)
        val prefs = getSharedPreferences("app", Context.MODE_PRIVATE)
        setContent {
            MaterialTheme(colorScheme = lightColorScheme(primary = Blue, error = Danger)) {
                var accepted by remember { mutableStateOf(prefs.getBoolean("disclaimer", false)) }
                if (!accepted) {
                    DisclaimerScreen { prefs.edit().putBoolean("disclaimer", true).apply(); accepted = true }
                } else {
                    App(content, store, prefs)
                }
            }
        }
    }
}

fun Context.dial(number: String) {
    startActivity(Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + Uri.encode(number))))
}

// One back stack for the whole app. Each entry has an id so its scroll position
// and search text survive while it is covered by a later screen.
class Entry(val id: Int, val screen: Screen)

@Composable
fun App(content: Content, store: ReviewStore, prefs: SharedPreferences) {
    val holder = rememberSaveableStateHolder()
    val nextId = remember { mutableIntStateOf(1) }
    val stack = remember { mutableStateListOf(Entry(0, Screen.Home)) }
    fun truncate(size: Int) {
        while (stack.size > size) holder.removeState(stack.removeAt(stack.lastIndex).id)
    }
    val go: (Screen) -> Unit = { stack.add(Entry(nextId.intValue++, it)) }
    val replace: (Screen) -> Unit = { stack[stack.lastIndex] = Entry(stack.last().id, it) }
    val back: () -> Unit = { truncate(stack.size - 1) }
    BackHandler(enabled = stack.size > 1) { back() }

    // Adult or child is chosen once and carried everywhere, and remembered.
    var age by remember { mutableStateOf(if (prefs.getString("age", null) == Age.CHILD.key) Age.CHILD else Age.ADULT) }
    val setAge: (Age) -> Unit = { age = it; prefs.edit().putString("age", it.key).apply() }

    val entry = stack.last()
    val screen = entry.screen
    val tab = tabOf(stack.getOrNull(1)?.screen)
    val color = when (screen) {
        is Screen.Topic -> topicColor(content, screen.topic)
        is Screen.Walkthrough -> topicColor(content, screen.topic)
        else -> tab.color
    }
    val due = store.all().values.count { it.daysUntilDue() <= 0 }

    // Dark status-bar icons on the white home screen, light ones over coloured top bars.
    val view = LocalView.current
    val lightStatusBar = screen == Screen.Home
    SideEffect {
        (view.context as? Activity)?.window?.let {
            WindowCompat.getInsetsController(it, view).isAppearanceLightStatusBars = lightStatusBar
        }
    }

    Scaffold(
        topBar = {
            if (screen != Screen.Home) Column {
                TopBar(title(screen, content), color, back)
                Breadcrumbs(stack.map { crumb(it.screen, content) }, color) { truncate(it + 1) }
            }
        },
        bottomBar = {
            Column {
                EmergencyBar()
                BottomNav(tab, due) { t ->
                    truncate(1)
                    when (t) {
                        Tab.HOME -> {}
                        Tab.GUIDE -> go(Screen.Triage(content.triageRoot))
                        Tab.TOPICS -> go(Screen.Topics)
                        Tab.REVIEW -> go(Screen.Review)
                        Tab.NUMBERS -> go(Screen.Contacts)
                    }
                }
            }
        },
    ) { pad ->
        Box(Modifier.padding(pad).fillMaxSize()) {
            holder.SaveableStateProvider(entry.id) {
                when (screen) {
                    Screen.Home -> HomeScreen(content, store, age, setAge, go)
                    is Screen.Triage -> TriageScreen(content, screen.node, age, setAge, go)
                    Screen.Topics -> TopicsScreen(content, store, age, go)
                    is Screen.Topic -> TopicScreen(content, store, screen.topic, screen.age, go) { setAge(it); replace(Screen.Topic(screen.topic, it)) }
                    is Screen.Walkthrough -> WalkthroughScreen(content, screen.topic, screen.age)
                    Screen.Review -> ReviewScreen(content, store, go)
                    Screen.Contacts -> ContactsScreen(content)
                    Screen.About -> AboutScreen()
                }
            }
        }
    }
}

fun topicColor(c: Content, topic: String) = c.groupOf(topic)?.color?.let { Color(it) } ?: Blue

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

fun crumb(s: Screen, c: Content): String {
    val label = when (s) {
        Screen.Home -> "Home"
        is Screen.Triage -> s.via ?: "Help now"
        Screen.Topics -> "Topics"
        is Screen.Topic -> "${c.icon(s.topic)} ${c.name(s.topic)}"
        is Screen.Walkthrough -> "Step by step"
        Screen.Review -> "Review"
        Screen.Contacts -> "Numbers"
        Screen.About -> "About"
    }
    return if (label.length > 30) label.take(28).trimEnd() + "…" else label
}

@Composable
fun TopBar(title: String, color: Color, back: () -> Unit) {
    TopAppBar(
        title = { Text(title, maxLines = 1, overflow = TextOverflow.Ellipsis, fontWeight = FontWeight.Bold) },
        navigationIcon = { IconButton(onClick = back) { Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back") } },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = color, titleContentColor = Color.White, navigationIconContentColor = Color.White,
        ),
    )
}

// The path from Home to here. Every earlier crumb is a jump straight back to it.
@Composable
fun Breadcrumbs(crumbs: List<String>, color: Color, onCrumb: (Int) -> Unit) {
    val scroll = rememberScrollState()
    LaunchedEffect(crumbs.size, scroll.maxValue) { scroll.scrollTo(scroll.maxValue) }
    Row(
        Modifier.fillMaxWidth().background(color.tint()).horizontalScroll(scroll).padding(horizontal = 6.dp, vertical = 4.dp),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        crumbs.forEachIndexed { i, label ->
            val last = i == crumbs.lastIndex
            if (i > 0) Text("›", color = color, fontSize = 18.sp)
            Text(
                label, maxLines = 1, fontSize = 14.sp,
                color = if (last) Color.Black else color,
                fontWeight = if (last) FontWeight.Bold else FontWeight.Medium,
                modifier = Modifier.clip(RoundedCornerShape(8.dp))
                    .then(if (last) Modifier else Modifier.clickable { onCrumb(i) })
                    .padding(horizontal = 8.dp, vertical = 8.dp),
            )
        }
    }
}

// Pinned on every screen: the one action that must never be more than a tap away.
@Composable
fun EmergencyBar() {
    val ctx = LocalContext.current
    Row(
        Modifier.fillMaxWidth().background(Danger).clickable { ctx.dial("101") }.padding(vertical = 12.dp),
        horizontalArrangement = Arrangement.Center, verticalAlignment = Alignment.CenterVertically,
    ) {
        Icon(Icons.Filled.Call, null, tint = Color.White)
        Spacer(Modifier.width(10.dp))
        Text("CALL 101 — Magen David Adom", color = Color.White, fontWeight = FontWeight.Bold, fontSize = 18.sp)
    }
}

// Tapping a section always lands on that section's first screen.
@Composable
fun BottomNav(current: Tab, due: Int, onTab: (Tab) -> Unit) {
    NavigationBar(containerColor = Color.White) {
        Tab.entries.forEach { t ->
            NavigationBarItem(
                selected = t == current,
                onClick = { onTab(t) },
                icon = {
                    BadgedBox(badge = { if (t == Tab.REVIEW && due > 0) Badge { Text("$due") } }) { Icon(t.icon, null) }
                },
                label = { Text(t.label, maxLines = 1, fontWeight = if (t == current) FontWeight.Bold else FontWeight.Normal) },
                colors = NavigationBarItemDefaults.colors(
                    selectedIconColor = t.color, selectedTextColor = t.color, indicatorColor = t.color.tint(0.18f),
                    unselectedIconColor = t.color.copy(alpha = 0.7f), unselectedTextColor = Color.DarkGray,
                ),
            )
        }
    }
}
