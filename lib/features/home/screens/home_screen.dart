import 'package:flutter/material.dart';

import '../widgets/calendar_header.dart';
import '../widgets/story_chips.dart';
import '../widgets/habit_card.dart';

/// 5 タブ＋右下 FAB を持つホーム画面
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── 上部 AppBar ────────────────────────────────────────────────
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {}, // TODO: 検索画面へ
        ),
        centerTitle: true,
        title: Text(
          'zenlock',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),

      // ── 画面本体 ────────────────────────────────────────────────────
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const CalendarHeader(),
          const SizedBox(height: 12),
          const StoryChips(),
          const SizedBox(height: 24),
          const HabitCard(),
          const SizedBox(height: 24),
          // ダミータイムライン
          ...List.generate(
            15,
            (i) => ListTile(
              leading: const Icon(Icons.circle_outlined),
              title: Text('Demo item ${i + 1}'),
            ),
          ),
        ],
      ),

      // ── 右下のペン形 FAB ────────────────────────────────────────────
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // TODO: 投稿画面へ
        shape: const CircleBorder(),
        child: const Icon(Icons.edit, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      // ── 5 つのボトムナビゲーション ───────────────────────────────
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.pie_chart_outline), label: 'Stats'),
          NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined), label: 'Calendar'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
        ],
      ),
    );
  }
}
