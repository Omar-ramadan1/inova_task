import 'package:flutter/material.dart';

import '../core/constants/colors.dart';


class AppbarWidget extends AppBar {
  AppbarWidget({
    super.key,
    required String title,
    required Widget iconButton,
  }) : super(
          backgroundColor: AppColor.mainAppColor,
          bottomOpacity: 0.0,
          centerTitle: true,
          title: Text(title),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu_outlined,
                size: 29,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          elevation: 0,
          actions: [
            iconButton,
          ],
        );
}
