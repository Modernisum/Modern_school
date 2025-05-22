import 'package:flutter/material.dart';
import 'package:modernschool/view/utils/constants/constant.dart';

class CheckExistingBox extends StatelessWidget {
  CheckExistingBox({super.key, this.value = false, this.press});
  final bool value;
  final VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 25,
        width: 25,
        decoration: value
            ? BoxDecoration(gradient: gradientColor)
            : BoxDecoration(border: Border.all(color: gray), color: white),
        child: Center(
            child: Icon(
          value ? Icons.check : Icons.close,
          color: white,
        )),
      ),
    );
  }
}
