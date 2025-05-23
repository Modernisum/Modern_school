import 'package:flutter/material.dart';
import 'package:modernschool/view/utils/constants/constant.dart';

class ClicableText extends StatelessWidget {
  ClicableText(
      {super.key,
      required this.text,
      required this.function,
      this.style,
      this.activeLine = false,
      this.lineColor = lightGray,
      this.length = 48});
  final String? text;
  final VoidCallback function;
  final TextStyle? style;
  final bool activeLine;
  final Color lineColor;
  final double length;
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
