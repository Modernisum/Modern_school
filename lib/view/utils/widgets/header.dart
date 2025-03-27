import 'package:flutter/material.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/constants/responsive.dart';
import 'package:modernschool/view/utils/widgets/menu.dart';

class Header extends StatelessWidget {
  Header(
      {super.key,
      required this.size,
      required this.text,
      this.logoutIconActivation = true,
      this.goBackButtonActivation = false,
      this.backTo});

  final Size size;
  final String text;
  bool logoutIconActivation;
  bool goBackButtonActivation;
  var backTo;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          if (!goBackButtonActivation)
            IconButton(
                onPressed: () => navigationController.controlMenu(),
                icon: Icon(Icons.menu)),
        if (goBackButtonActivation)
          Padding(
            padding: EdgeInsets.only(right: defaultPadding),
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Colors.red,
                  size: Responsive.isDesktop(context)
                      ? 32
                      : Responsive.isTablet(context)
                          ? 24
                          : 20),
              onPressed: backTo,
            ),
          ),
        Text(
          text,
          style: redHatMediumStyle(
              color: white,
              fontSize: Responsive.isDesktop(context)
                  ? 32
                  : Responsive.isTablet(context)
                      ? 24
                      : 16),
        ),
        /*Spacer(),
        if (logoutIconActivation) LogoutButton()*/
      ],
    );
  }
}
