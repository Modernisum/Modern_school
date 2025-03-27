import 'package:flutter/material.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/constants/responsive.dart';

class DarwerListItem extends StatelessWidget {
  const DarwerListItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.press});
  final String title;
  final IconData icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => press.call(),
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        size: Responsive.isDesktop(context) ? 14 : 14,
        color: white.withOpacity(0.75),
      ),
      title: Text(
        title,
        style: redHatRegularStyle(
            color: white, fontSize: Responsive.isDesktop(context) ? 18 : 16),
      ),
    );
  }
}
