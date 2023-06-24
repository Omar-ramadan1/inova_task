// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../core/constants/colors.dart';


class SearchWidget extends StatelessWidget {
  final String hint;

  const SearchWidget(this.hint, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        color: AppColor.mainAppColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10),
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColor.bluecolor,
              fontSize: 20,
            ),
            alignLabelWithHint: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0xFFDBDBDB),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
