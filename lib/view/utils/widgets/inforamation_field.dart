import 'package:flutter/material.dart';
import '../constants/constant.dart';
import '../constants/font_style.dart';
import '../constants/responsive.dart';

class InformationField extends StatelessWidget {
  InformationField(
      {super.key,
      required this.label,
      required this.textController,
      this.icon,
      this.enableEdit = true,
      this.inputType = TextInputType.text,
      this.activeIcon = true});
  final TextEditingController textController;
  final String label;
  final IconData? icon;
  final TextInputType inputType;
  final bool enableEdit;
  final bool activeIcon;
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enableEdit,
      child: TextField(
        onChanged: (value) {},
        controller: textController,
        keyboardType: inputType,
        maxLines: 1,
        style: redHatMediumStyle(
            color: darkGray,
            fontSize: Responsive.isDesktop(context)
                ? 24
                : Responsive.isTablet(context)
                    ? 20
                    : 16),
        cursorColor: darkGray,
        decoration: InputDecoration(
          filled: true,
          fillColor: white,
          labelText: label,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: activeIcon
                ? Icon(
                    icon,
                    size: Responsive.isDesktop(context)
                        ? 28
                        : Responsive.isTablet(context)
                            ? 24
                            : 20,
                  )
                : null,
          ),
          labelStyle: redHatMediumStyle(
              color: gray,
              fontSize: Responsive.isDesktop(context)
                  ? 24
                  : Responsive.isTablet(context)
                      ? 20
                      : 16),
        ),
      ),
    );
  }
}
