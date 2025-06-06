// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // ← 追加
import 'package:zenlock/main.dart';

import 'fakes.dart'; // FakeNativebrikBridge を使う場合だけ

void main() {
  // ここで .env をロード
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized(); // ← これが先
    await dotenv.load(fileName: '.env.dev'); // dev 用 .env
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // env から読み出し
    final projectId = dotenv.env['NATIVEBRIK_PROJECT_ID']!;

    await tester.pumpWidget(
      ZenLockMockApp(
        nativebrik: FakeNativebrikBridge(), // ← 例: Fake を注入
      ),
    );

    // 以下は元のテストロジック
    expect(find.text('0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
