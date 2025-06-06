import 'package:flutter/material.dart';

/// 画面上部のカレンダーヘッダー + 波型グラフ背景
class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Column(
        children: [
          // ── 背景（グラデーション + 波線）────────────────────────────
          Expanded(
            child: Stack(
              children: [
                // グラデーション背景
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFFF5F5),
                          Color(0xFFFFEDED),
                        ],
                      ),
                    ),
                  ),
                ),
                // 波線
                const Positioned.fill(
                  child: CustomPaint(
                    painter: const _WavePainter(), // ★ ここも const を付ける
                  ),
                ),
              ],
            ),
          ),
          // ── 日付ラベル行 ─────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              7,
              (i) => Column(
                children: [
                  Text(
                    '${21 + i}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '土日月火水木金'[i],
                    style:
                        const TextStyle(fontSize: 12, color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// カレンダーヘッダー下部に敷く波形グラフ
class _WavePainter extends CustomPainter {
  const _WavePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height * .8)
      ..quadraticBezierTo(
          size.width * .25, size.height * .5, size.width * .5, size.height * .7)
      ..quadraticBezierTo(
          size.width * .75, size.height, size.width, size.height * .6)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final paint = Paint()..color = const Color(0xFFFFB74D); // オレンジ
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
