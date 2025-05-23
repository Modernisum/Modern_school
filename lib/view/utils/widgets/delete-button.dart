import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';

import '../constants/responsive.dart';

class DeleteButton extends StatelessWidget {
  final String text;
  final Function press;

  DeleteButton({
    super.key,
    required this.press,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Container(
        height: Responsive.isMobile(context) ? 76 : 100,
        width: Responsive.isMobile(context) ? 200 : 360,
        decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(Responsive.isDesktop(context)
              ? 20
              : Responsive.isTablet(context)
                  ? 16
                  : 14),
        ),
        child: Center(
          child: Text(
            text,
            style: redHatBoldStyle(
                color: white,
                fontSize: Responsive.isDesktop(context)
                    ? 28
                    : Responsive.isTablet(context)
                        ? 24
                        : 20),
          ),
        ),
      ),
    );
  }
}
