import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/screens/main-screen/main-controller.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/constants/responsive.dart';
//import 'package:modernschool/view/utils/widgets/menu.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.text,
    required this.size,
    this.logoutIconActivation = true,
    this.goBackButtonActivation = false,
    this.backTo,
  });

  final String text;
  final Size size;
  final bool logoutIconActivation;
  final bool goBackButtonActivation;
  final Function()? backTo;

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find<MainController>();
    return Container(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (goBackButtonActivation)
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: backTo,
            )
          else
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => controller.controlMenu(),
            ),
          Text(
            text,
            style: redHatBoldStyle(
                color: darkGray,
                fontSize: Responsive.isDesktop(context)
                    ? 32
                    : Responsive.isTablet(context)
                        ? 28
                        : 24),
          ),
          if (logoutIconActivation)
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // Add logout functionality here
              },
            )
          else
            SizedBox(width: 40),
        ],
      ),
    );
  }
}
