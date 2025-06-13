import 'package:flutter/material.dart';

import '../widgets/campaign_card.dart';
import '../widgets/calendar_header.dart';
import '../widgets/story_chips.dart';
import '../widgets/habit_card.dart';

// App-wide globals
import '../../../app_globals.dart';

// SDK の Tooltip ウィジェット
import 'package:nativebrik_bridge/tooltip.dart'; // ← NativebrikTooltip がここに入っている

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
    return Stack(
      // ★ Tooltip を重ねるための Stack
      children: [
        Scaffold(
          // ── AppBar ──────────────────────────────────────────────
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              key: AppGlobals.searchBtnKey, // ★ Anchor: search_button
              icon: const Icon(Icons.search),
              onPressed: () {},
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

          // ── Body ────────────────────────────────────────────────
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const CalendarHeader(),
              const SizedBox(height: 12),
              const StoryChips(),
              const SizedBox(height: 24),
              const HabitCard(),
              const SizedBox(height: 24),
              const CampaignCard(),
              ...List.generate(
                15,
                (i) => ListTile(
                  leading: const Icon(Icons.circle_outlined),
                  title: Text('Demo item ${i + 1}'),
                ),
              ),
            ],
          ),

          // ── Floating Action Button ─────────────────────────────
          floatingActionButton: FloatingActionButton(
            key: AppGlobals.floatBtnKey, // ★ Anchor: float_button
            onPressed: () {},
            shape: const CircleBorder(),
            child: const Icon(Icons.edit, size: 30),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

          // ── Bottom Navigation ─────────────────────────────────
          bottomNavigationBar: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              const NavigationDestination(
                icon: Icon(Icons.pie_chart_outline),
                label: 'Stats',
              ),
              const NavigationDestination(
                icon: Icon(Icons.calendar_month_outlined),
                label: 'Calendar',
              ),
              NavigationDestination(
                icon: Icon(Icons.search, key: AppGlobals.searchBtnKey),
                label: 'Search',
              ),
              NavigationDestination(
                // NavigationDestination には key が無いので icon 側に付与
                icon: Icon(Icons.account_circle_outlined,
                    key: AppGlobals.profileTabKey),
                label: 'Profile',
              ),
            ],
          ),
        ),

        // ── Nativebrik Tooltip Overlay ──────────────────────────
        NativebrikTooltip(
          // ★ SDK 提供の Widget
          keysReference: AppGlobals.keysReference,
        ),
      ],
    );
  }
}
