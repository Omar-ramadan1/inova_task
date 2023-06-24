import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/appRoute.dart';
import '../../core/constants/app_decoration.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/strings.dart';
import '../../core/service/checkinternet.dart';
import '../../core/service/internetconnect.dart';
import '../../core/service/notificationhelper.dart';
import '../productScreen/Controller/productScreenController.dart';
import 'Controller/signinScreenController.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'WidgetsOfSignIn/button_widget.dart';
import 'WidgetsOfSignIn/subTitle_widget.dart';
import 'WidgetsOfSignIn/textfieldPass_widget.dart';
import 'WidgetsOfSignIn/textfield_widget.dart';

class SignInScreen extends StatefulWidget {
  static const routename = AppRoute.signinRoute;

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends SignInScreenContoller {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passworldcontroller = TextEditingController();
  bool secure = true;
  bool hasInterNetConnection = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     tz.initializeTimeZones();

    NotificationService()
        .showNotification(2, AppStrings.inovaTask, AppStrings.feedback, 1);
    NotificationService()
        .showNotification(1, AppStrings.inovaTask, AppStrings.contactMe, 1);

    NotificationService()
        .showNotification(3, AppStrings.inovaTask, AppStrings.niceday, 2);
    ConnectionUtilProvider.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainAppColor,
      body: ListView(
        children: [
          SizedBox(
            height: 200,
          ),
          Form(
            key: _formKey,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: AppDecor.tableDecoration,
                child: Column(
                  children: [
                    //     TitleOfPage("Login now"),
                    SizedBox(
                      height: 40,
                    ),
                    TextField_Widget("Email", _emailcontroller, (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.fieldEmpty;
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                        return "formant wrong";
                      }
                      return null;
                    }),
                    SizedBox(
                      height: 25,
                    ),
                    TextFieldPass_Widget(
                        AppStrings.passworld,
                        _passworldcontroller,
                        (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.fieldEmpty;
                          }
                          if (value.length < 6) {
                            return "pass wrong";
                          }
                          return null;
                        },
                        secure,
                        () {
                          setState(() {
                            secure = !secure;
                          });
                        }),
                    SizedBox(
                      height: 25,
                    ),
                    StreamBuilder(
                        stream: InternetFunction.isConnectedToInternet.stream,
                        builder: (BuildContext context,
                            AsyncSnapshot<bool> isConnectedStream) {
                          bool isConnected = isConnectedStream.hasData
                              ? isConnectedStream.data!
                              : false;
                          debugPrint(InternetFunction.hasInterNetConnection
                              .toString());
                          return InternetFunction.hasInterNetConnection
                              ? Button_widget("SIGN IN", () {
                                  if (_formKey.currentState!.validate()) {
                                    gotohomeScreen();
                                  }
                                })
                              : Container(
                                  child: Text(
                                      "check the internet and button will appear"),
                                );
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    SubTitle_Widget(
                        "make sure you connect with internet please",
                        "in case of no internet button will not appeat",
                        () {}),
                    SubTitle_Widget("i hope you like my code ",
                        "please dont forget the feedback", () {})
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
