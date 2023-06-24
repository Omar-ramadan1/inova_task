import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ContextExtension on BuildContext {

  double width() => MediaQuery.of(this).size.width;
  double height() => MediaQuery.of(this).size.height;

  void showSnackBar(
    String text, {
    Color? color,
  }) {
    SnackBar snackBar = SnackBar(
      backgroundColor: color ?? Colors.red,
      content: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void showCustomToast(String msg, {Color? color}) {
    FToast fToast = FToast();
    fToast.init(this);
    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Text(msg, style: TextStyle(fontSize: 16),),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );
  }

  Future alertDialog({
    required String content,
    required Widget widget,
    required Widget widget2,
  }) {
    return showDialog(
      context: this,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ],
          ),
          actions: [widget, widget2],
        );
      },
    );
  }
}
