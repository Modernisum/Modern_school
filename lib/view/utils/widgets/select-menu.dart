import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant.dart';
import '../constants/font_style.dart';
import '../constants/responsive.dart';

class DropDownSelectingMenu extends StatelessWidget {
  DropDownSelectingMenu({
    super.key,
    required this.selectedOption,
    required this.setSelectedOption,
    required this.selectOptions,
    this.enableEdit = true,
  });
  final bool enableEdit;
  final String selectedOption;
  final Function setSelectedOption;
  final List<String> selectOptions;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 36,
          right: 16,
          top: Responsive.isDesktop(context) ? 4 : 0,
          bottom: Responsive.isDesktop(context) ? 4 : 0),
      decoration: BoxDecoration(
        border: Border.all(color: lightGray, width: 3),
        borderRadius: BorderRadius.circular(20.r),
        color: white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          iconSize: Responsive.isDesktop(context)
              ? 32
              : Responsive.isTablet(context)
                  ? 28
                  : 24,
          icon: Icon(
            Icons.arrow_drop_down,
            color: gray,
          ),
          isExpanded: true,
          hint: Text(
            selectedOption,
            style: redHatMediumStyle(
                color: gray,
                fontSize: Responsive.isDesktop(context)
                    ? 24
                    : Responsive.isTablet(context)
                        ? 20
                        : 16),
          ),
          onChanged: enableEdit
              ? (newValue) {
                  setSelectedOption(newValue);
                }
              : null,
          items: selectOptions.map((selectedType) {
            return DropdownMenuItem(
              value: selectedType,
              child: Text(
                selectedType,
                style: redHatMediumStyle(
                    color: gray,
                    fontSize: Responsive.isDesktop(context)
                        ? 24
                        : Responsive.isTablet(context)
                            ? 20
                            : 16),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
