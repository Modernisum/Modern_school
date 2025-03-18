import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';

class CustomButton extends StatelessWidget {
  double height;
  double width;
  double radius;
  Function press;
  CustomButton(
      {required this.press,
      this.height = 100,
      this.width = 100,
      this.radius = 20});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => press(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: gradientColor,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.15),
                  blurRadius: 12.r,
                  offset: Offset(0, 3)),
            ]),
        child: Center(
          child: Text(
            'log in',
            style: sfMediumStyle(color: white, fontSize: 25.sp),
          ),
        ),
      ),
    );
  }
}
