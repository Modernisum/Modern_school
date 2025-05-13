import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/utils/constants/constant.dart';

import '../../utils/constants/font_style.dart';
import '../../utils/widgets/cliackable_text.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/widgets/custom_formfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ForgotPasswordScreen({super.key});

  void resetPassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      String email = emailController.text.trim();
      Get.snackbar(
        'Password Reset',
        'A password reset link has been sent to $email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 700, // Adjusts to 80% of screen width
            minWidth: 0.6.sw, // Adjusts to 60% of screen width
            maxHeight: 0.9.sh, // Adjusts to 90% of screen height
          ),
          padding: EdgeInsets.all(50.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                  child: Column(
                    children: [
                      Text(
                        'Modern School',
                        style: redHatBoldStyle(
                            color: purple, fontSize: size.width / 25),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Modernize Your School',
                        style: redHatMediumStyle(
                            color: purple.withOpacity(0.7),
                            fontSize: size.width / 60),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Forgot Password',
                  style: redHatBoldStyle(
                      color: Colors.purple, fontSize: size.width / 29.2),
                ),
                SizedBox(height: 20.h),
                customFormField(
                  controller: emailController,
                  label: 'Email',
                  prefix: Icons.email,
                  onChange: (String val) {},
                  type: TextInputType.emailAddress,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Email must not be empty';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  press: () => resetPassword(context),
                  height: 50.h,
                  width: size.width / 2,
                  radius: 20.r,
                  text: 'Reset Password',
                ),
                SizedBox(height: 20.h),
                ClicableText(
                  text: 'Back to Login',
                  style: sfRegularStyle(color: Colors.purple, fontSize: 20.sp),
                  function: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
