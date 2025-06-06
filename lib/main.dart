import 'package:flutter/material.dart';
import 'features/home/screens/home_screen.dart';

void main() {
  // 必要に応じて WidgetsFlutterBinding.ensureInitialized();
  runApp(const ZenLockMockApp());
}

/// アプリ全体のルート
class ZenLockMockApp extends StatelessWidget {
  const ZenLockMockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'zenlock mock',
      debugShowCheckedModeBanner: false,

      // ── テーマ設定 ──────────────────────────────────────────────
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff1a4ad8), // アプリのキーカラー
        useMaterial3: true,
        fontFamily: 'RoundedMplus', // pubspec.yaml に登録していれば反映
      ),

      // ── ルート画面 ───────────────────────────────────────────────
      home: const HomeScreen(),
    );
  }
}
