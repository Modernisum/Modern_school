import 'package:flutter/cupertino.dart';

import '../constants/constant.dart';
import '../constants/font_style.dart';
import '../constants/responsive.dart';

class CancelButton extends StatelessWidget {
  CancelButton({super.key, required this.press, this.text = 'cancel'});
  final VoidCallback press;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: Responsive.isDesktop(context)
            ? 60
            : Responsive.isTablet(context)
                ? 56
                : 48,
        width: Responsive.isDesktop(context)
            ? 200
            : Responsive.isTablet(context)
                ? 180
                : 160,
        decoration: BoxDecoration(
          border: Border.all(
              width: Responsive.isMobile(context) ? 2 : 3, color: gray),
          borderRadius:
              BorderRadius.circular(Responsive.isMobile(context) ? 4 : 8),
        ),
        child: Center(
          child: Text(
            text,
            style: redHatMediumStyle(
                color: gray,
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
