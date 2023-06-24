import 'package:flutter/material.dart';
import 'package:inova_task/core/constants/colors.dart';
import 'package:inova_task/core/extentions/context_extension.dart';
import 'package:inova_task/core/extentions/extensions.dart';

import '../../productScreen/productScreen.dart';
import '../signin_screen.dart';



// abstract class to share common data
abstract class SignInScreenContoller extends State<SignInScreen> {
  gotohomeScreen() {
    context.showCustomToast("i hope you like my code",color: AppColor.bluecolor);
    // context.showSnackBar("please don't forget the feedback");
    context.push(MyHomePage());
  }


}
