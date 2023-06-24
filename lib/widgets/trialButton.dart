// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inova_task/core/extentions/context_extension.dart';

import '../core/constants/colors.dart';




class TrialButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const TrialButton(
    this.text, {
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<TrialButton> createState() => _TrialButtonState();
}

class _TrialButtonState extends State<TrialButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 15),
      child: Column(
        children: [
          Container(
            height: 65,
            width: context.width()/2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.bluecolor,
            ),
            child: MaterialButton(
              onPressed: widget.onPressed,
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
