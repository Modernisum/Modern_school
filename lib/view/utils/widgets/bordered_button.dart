import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modernschool/view/utils/constants/constant.dart';

class BorderedButton extends StatelessWidget {
  BorderedButton(
      {super.key,
      required this.function,
      required this.text,
      this.color = purple,
      this.radius = 20,
      this.height = 100,
      this.width = 100,
      this.borderSize = 2,
      required this.icon,
      required this.textStyle});
  String text;
  Color color;
  double height;
  double width;
  double radius;
  double borderSize;
  TextStyle? textStyle;
  Function function;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: color),
            borderRadius: BorderRadius.circular(radius)),
        height: 48,
        width: 200,
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: color,
                size: 36.h,
              ),
              Text(
                text,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
