import 'package:nativebrik_bridge/nativebrik_bridge.dart';

/// ネイティブ呼び出しを行わない簡易 Fake.
/// 必要最小限のメソッドだけオーバーライドすれば OK。
class FakeNativebrikBridge extends NativebrikBridge {
  FakeNativebrikBridge() : super('dummy-project-id');

  @override
  Future<void> identify(NativebrikUser user) async {
    // 何もしない
  }

  // 他に呼ばれるメソッドがあれば同様に stub 化
}
