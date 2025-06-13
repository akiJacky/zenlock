// lib/app_globals.dart
import 'package:flutter/widgets.dart';

class AppGlobals {
  // Tooltip anchors
  static final searchBtnKey = GlobalKey();
  static final profileTabKey = GlobalKey();
  static final floatBtnKey = GlobalKey();
  static final habitCardKey = GlobalKey();

  static final keysReference = <String, GlobalKey>{
    'search_button': searchBtnKey,
    'profile_tab': profileTabKey,
    'float_button': floatBtnKey,
    'habit_card': habitCardKey,
  };
}
