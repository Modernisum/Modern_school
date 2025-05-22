import 'package:flutter/material.dart';
import 'package:modernschool/view/utils/constants/constant.dart';

import '../constants/font_style.dart';

// ignore: use_key_in_widget_constructors
class CustomDialog extends StatelessWidget {
  CustomDialog({
    super.key,
    required this.controller,
    this.onChange,
    this.validate,
  });
  final String? Function(String?)? validate;
  final Function? onChange;
  final TextEditingController controller;
  dialogContent(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.15),
            blurRadius: 12.0,
            offset: Offset(0.0, 3.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              "Add Grade",
              style: redHatMediumStyle(fontSize: 16, color: darkGray),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                'grade name: ',
                style: sfRegularStyle(fontSize: 13, color: black),
              ),
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                validator: validate,
                onChanged: (s) {
                  onChange!(s);
                },
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width / 1.8,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                  gradient: gradientColor),
              child: Center(
                child: Text(
                  'Send',
                  style: sfMediumStyle(fontSize: 16, color: white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
