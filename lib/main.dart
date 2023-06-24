import 'package:flutter/material.dart';
import 'package:inova_task/presentation/productScreen/productScreen.dart';
import 'package:inova_task/presentation/signin/signin_screen.dart';
import 'core/constants/strings.dart';
import 'core/service/notificationhelper.dart';
import 'helper/app_theme.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
    NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.inovaTask,
      theme: AppTheme.appTheme,

      //run the app please and make sure you connect with inernet because i used streams to check the internet 
      //enter any fake data for sign in 
      //then you can see the mock data
      // sorry i had now time to complete all the test , but i did my best i hope you like it
      // app have local notification and streams for check internet 
      //thanks in advance and please don't for get your feedback ,
      //your feedback will be so important to me 

      home:  SignInScreen(),
      routes: {
                SignInScreen.routename:(ctx) => SignInScreen(),
                MyHomePage.routename:(ctx)=> MyHomePage()
      },
    );
  }
}

