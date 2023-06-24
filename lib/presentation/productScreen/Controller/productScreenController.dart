import 'package:flutter/material.dart';
import 'package:inova_task/core/extentions/context_extension.dart';

import '../productScreen.dart';



// abstract class to share common data

abstract class ProductScreenContoller extends State<MyHomePage> {
  showsnackbar() {
    context.showSnackBar("hallo that's just a test for fun");
  }


}
