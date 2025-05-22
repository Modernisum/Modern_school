import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import '../constants/constant.dart';
import '../constants/responsive.dart';

class WeekDay extends StatelessWidget {
  WeekDay(
      {super.key,
      this.text = 'day',
      this.onPress,
      this.isSelected = false,
      this.isActiveDay = false});
  final String text;
  final bool isSelected;
  final bool isActiveDay;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    double radius = isSelected
        ? Responsive.isDesktop(context)
            ? 76
            : Responsive.isTablet(context)
                ? 72
                : 60
        : Responsive.isDesktop(context)
            ? 60
            : Responsive.isTablet(context)
                ? 56
                : 48;

    return SizedBox(
      width: radius + 20,
      height: Responsive.isMobile(context) ? radius + 40 : radius + 20,
      child: Center(
        child: Column(
          children: [
            isSelected
                ? InkWell(
                    onTap: onPress,
                    child: Animator<double>(
                      cycles: 0,
                      curve: Curves.easeInToLinear,
                      tween: Tween<double>(begin: radius, end: radius + 8),
                      duration: Duration(milliseconds: 1500),
                      builder: (context, animatorState, child) => Container(
                          height: animatorState.value,
                          width: animatorState.value,
                          decoration: isActiveDay
                              ? BoxDecoration(
                                  gradient: gradientColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                      BoxShadow(
                                          color: black.withOpacity(0.25),
                                          blurRadius: 12.r,
                                          offset: Offset(0, 3))
                                    ])
                              : BoxDecoration(
                                  color: white,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: gray, width: 2)),
                          child: Center(
                              child: Text(
                            text,
                            style: isActiveDay
                                ? redHatBoldStyle(color: white, fontSize: 24)
                                : redHatMediumStyle(color: gray, fontSize: 20),
                          ))),
                    ),
                  )
                : InkWell(
                    onTap: onPress,
                    child: Container(
                        height: radius,
                        width: radius,
                        decoration: isActiveDay
                            ? BoxDecoration(
                                color: lightPurple,
                                shape: BoxShape.circle,
                              )
                            : BoxDecoration(
                                color: white,
                                shape: BoxShape.circle,
                                border: Border.all(color: gray, width: 2)),
                        child: Center(
                            child: Text(
                          text,
                          style: isActiveDay
                              ? redHatMediumStyle(color: white, fontSize: 20)
                              : redHatMediumStyle(color: gray, fontSize: 20),
                        ))),
                  ),
            // if (isSelected)
            //     Column(
            //       children: [
            //         SizedBox(
            //           height: 20,

            //     ),
            //     CancelButton(
            //       press: () {
            //         print('bo3bo3');
            //       },
            //       text: 'Daily Check',
            //     ),]
            //     )
          ],
        ),
      ),
    );
  }
}
