import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/utils/constants/constant.dart';

import '../../utils/constants/font_style.dart';
import '../../utils/widgets/cliackable_text.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/widgets/custom_formfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  // Create a static key
  static final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  // Using the static key from the widget class instead of creating a new one
  // final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void resetPassword() {
    if (ForgotPasswordScreen.forgotPasswordFormKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      
      // Simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        String email = emailController.text.trim();
        Get.snackbar(
          'Password Reset',
          'A password reset link has been sent to $email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.back();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        key: const ValueKey<String>('forgot_password_container'),
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            key: const ValueKey<String>('forgot_password_scroll'),
            child: Container(
              key: const ValueKey<String>('forgot_password_form_container'),
              constraints: BoxConstraints(
                maxWidth: 0.6.sw,
                minWidth: 0.4.sw,
                maxHeight: 0.9.sh,
              ),
              padding: EdgeInsets.all(30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Form(
                key: ForgotPasswordScreen.forgotPasswordFormKey,
                child: Column(
                  key: const ValueKey<String>('forgot_password_column'),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      key: const ValueKey<String>('forgot_password_header'),
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: Column(
                        children: [
                          Text(
                            'Modern School',
                            style: redHatBoldStyle(color: purple, fontSize: 22.sp),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Reset Your Password',
                            style: redHatMediumStyle(
                              color: lightPurple,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
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
                        if (!GetUtils.isEmail(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      press: () => _isLoading ? null : resetPassword(),
                      height: 45.h,
                      width: 150.w,
                      radius: 20.r,
                      text: _isLoading ? 'Sending...' : 'Reset Password',
                    ),
                    SizedBox(height: 20.h),
                    ClicableText(
                      text: 'Back to Login',
                      style: sfRegularStyle(color: purple, fontSize: 16.sp),
                      function: () => Get.back(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
