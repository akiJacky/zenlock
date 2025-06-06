import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'features/home/screens/home_screen.dart';

// env
import 'package:flutter_dotenv/flutter_dotenv.dart';

// nativebrik
import 'package:nativebrik_bridge/nativebrik_bridge.dart';
import 'package:nativebrik_bridge/provider.dart';
import 'package:nativebrik_bridge/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Nativebrik Bridge SDK
  await dotenv.load(
    fileName: kReleaseMode ? '.env.prod' : '.env.dev',
  );

  final projectId = dotenv.env['NATIVEBRIK_PROJECT_ID']!;
  final nativebrik = NativebrikBridge(projectId);

  // 2. Set user's properties before runApp
  final user = NativebrikUser();
  await user.setProperties({
    'environment': kReleaseMode ? 'production' : 'development',
    // 'email': 'user@example.com',
    // 'name' : 'Aki Nakano',
  });

  runApp(ZenLockMockApp(nativebrik: nativebrik));
}

/// アプリ全体ルート
class ZenLockMockApp extends StatelessWidget {
  const ZenLockMockApp({super.key, required this.nativebrik});

  final NativebrikBridge nativebrik;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZenLock Mock',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff1a4ad8),
        useMaterial3: true,
      ),
      // Provider を builder でラップ
      builder: (context, child) => NativebrikProvider(
        child: child!,
      ),
      home: const HomeScreen(),
    );
  }
}
