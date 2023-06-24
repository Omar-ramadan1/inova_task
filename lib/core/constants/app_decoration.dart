import 'package:flutter/material.dart';

import 'colors.dart';

class AppDecor {
  static BoxDecoration tableDecoration = BoxDecoration(
    color: AppColor.whitecolor,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35),
         topRight: Radius.circular(35),
         bottomLeft: Radius.circular(35),
         bottomRight: Radius.circular(35)),
         
  );
}
