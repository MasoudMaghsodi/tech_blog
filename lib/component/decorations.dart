import 'package:flutter/material.dart';

import '../constant/my_colors.dart';

class MyDecorations {
  MyDecorations._();
  static BoxDecoration mainGradiant = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(18)),
    gradient: LinearGradient(colors: gradiantColors.bottomNav),
  );
}
