import 'package:flutter/material.dart';
import '../../../app_globals.dart';

/// 「習慣化ガイド」などのお知らせを表示するカード
class HabitCard extends StatelessWidget {
  const HabitCard({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      key: AppGlobals.habitCardKey,
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        children: [
          Text('習慣化ガイド', style: TextStyle(color: scheme.primary)),
          const SizedBox(height: 8),
          const Text(
            '明日も投稿できると\n新しいカラーテーマをお送りします ☕️',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
