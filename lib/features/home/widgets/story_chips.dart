import 'package:flutter/material.dart';

/// Quote / Snapshot / Tips … などを横スクロールで表示する丸チップ一覧
class StoryChips extends StatelessWidget {
  const StoryChips({super.key});

  static const _items = [
    ('Quote', Icons.format_quote),
    ('Snapshot', Icons.image_search),
    ('Tips 1/13', Icons.auto_stories),
    ('Weekly', Icons.insights),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: _items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          final (label, icon) = _items[index];
          return Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(icon, color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 4),
              Text(label, style: const TextStyle(fontSize: 12)),
            ],
          );
        },
      ),
    );
  }
}
