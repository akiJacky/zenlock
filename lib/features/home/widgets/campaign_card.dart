import 'package:flutter/material.dart';
import 'package:nativebrik_bridge/embedding.dart';

/// 「習慣化ガイド」などのお知らせを表示するカード
class CampaignCard extends StatelessWidget {
  const CampaignCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NativebrikEmbedding("CAMPAIGN_CARD", height: 140),
      ],
    );
  }
}
