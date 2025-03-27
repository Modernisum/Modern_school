import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/constants/responsive.dart';

class ClicableText extends StatelessWidget {
  ClicableText(
      {super.key,
      required this.text,
      required this.function,
      this.style,
      this.activeLine = false,
      this.lineColor = lightGray,
      this.length = 48});
  String? text;
  var function;
  TextStyle? style;
  bool activeLine;
  Color lineColor;
  double length;
  @override
  Widget build(BuildContext context) {
    return !activeLine
        ? InkWell(
            onTap: function,
            child: Text(
              text!,
              style: style,
            ),
          )
        : Column(
            children: [
              InkWell(
                onTap: function,
                child: Text(
                  text!,
                  style: style,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 4,
                width: length,
                decoration: BoxDecoration(
                    color: lineColor, borderRadius: BorderRadius.circular(50)),
              )
            ],
          );
  }
}
