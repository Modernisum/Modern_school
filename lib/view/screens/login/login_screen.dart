import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/routes/app_pages.dart';
import 'package:modernschool/view/screens/contact/contact_screen.dart';
import 'package:modernschool/view/screens/login/login_controller.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/my_icons.dart';
import 'package:modernschool/view/utils/widgets/bordered_button.dart';
import 'package:modernschool/view/utils/widgets/cliackable_text.dart';
import 'package:modernschool/view/utils/widgets/custom_button.dart';

import '../../utils/constants/font_style.dart';
import '../../utils/constants/utils.dart';
import '../../utils/widgets/custom_formfield.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final loginFormKey = GlobalKey<FormState>();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  Future<void> login() async {
    final LoginController controller = Get.find<LoginController>();
    if (!_validateInputs(controller)) return;

    setState(() => _isLoading = true);

    try {
      final querySnapshot = await _firestore.collection('admin').get();
      bool isValidUser = querySnapshot.docs.any((doc) =>
          doc['email'] == controller.emailController.text.trim() &&
          doc['password'] == controller.passwordController.text);

      if (isValidUser) {
        Get.offAllNamed(AppPages.mainScreen);
      } else {
        showSnackBar("Invalid email or password", context);
      }
    } catch (err) {
      showSnackBar("An error occurred. Please try again.", context);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  bool _validateInputs(LoginController controller) {
    if (controller.emailController.text.trim().isEmpty) {
      showSnackBar("Please enter your email", context);
      return false;
    }
    if (!GetUtils.isEmail(controller.emailController.text.trim())) {
      showSnackBar("Please enter a valid email", context);
      return false;
    }
    if (controller.passwordController.text.isEmpty) {
      showSnackBar("Please enter your password", context);
      return false;
    }
    if (controller.passwordController.text.length < 6) {
      showSnackBar("Password must be at least 6 characters", context);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();
    return Scaffold(
      body: Container(
        key: const ValueKey<String>('login_main_container'),
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background2.jpg"),
                fit: BoxFit.cover)),
        child: Container(
          key: const ValueKey<String>('login_content_container'),
          height: 0.6.sh,
          width: 0.6.sw,
          child: Column(
            key: const ValueKey<String>('login_main_column'),
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(34.h),
                child: Center(
                  child: Column(
                    key: const ValueKey<String>('login_center_column'),
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50.h),
                      Container(
                        key: const ValueKey<String>('login_form_container'),
                        constraints: BoxConstraints(
                          maxWidth: 0.6.sw,
                          minWidth: 0.4.sw,
                          maxHeight: 0.7.sh,
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
                          key: LoginScreen.loginFormKey,
                          child: Column(
                            key: const ValueKey<String>('login_form_column'),
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                key: const ValueKey<String>('login_header_container'),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Modern School',
                                      style: redHatBoldStyle(
                                          color: purple, fontSize: 22.sp),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'Enjoy Managing Your School',
                                      style: redHatMediumStyle(
                                          color: lightPurple, fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30.h),
                              customFormField(
                                controller: controller.emailController,
                                label: 'Email',
                                prefix: Icons.email,
                                onChange: (String val) {},
                                type: TextInputType.emailAddress,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'email must not be empty';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 40.h),
                              customFormField(
                                controller: controller.passwordController,
                                label: 'Password',
                                prefix: Icons.lock,
                                onChange: (String val) {},
                                suffix: controller.isPassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                isPassword: controller.isPassword.value,
                                suffixPressed: () {
                                  controller.showPassword();
                                },
                                type: TextInputType.visiblePassword,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'password is too short';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 25.h),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: ClicableText(
                                  text: 'Forgot Password?',
                                  style: sfRegularStyle(
                                      color: purple, fontSize: 16.sp),
                                  function: () {
                                    Get.to(() => ForgotPasswordScreen());
                                  },
                                ),
                              ),
                              SizedBox(height: 60.h),
                              CustomButton(
                                press: () => _isLoading ? null : login(),
                                height: 0.1.sh,
                                width: 150.w,
                                radius: 20.r,
                                text: _isLoading ? 'Logging in...' : 'Login',
                              ),
                              SizedBox(height: 30.h)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                width: 1.sw,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Center(
                  child: MouseRegion(
                    onEnter: (_) => controller.isHovering.value = true,
                    onExit: (_) => controller.isHovering.value = false,
                    child: Obx(() => BorderedButton(
                          function: () {
                            Get.to(() => ContactScreen());
                          },
                          text: 'Contact us',
                          icon: MyIcons.contact_us,
                          textStyle: redHatMediumStyle(
                              color:
                                  controller.isHovering.value ? purple : purple,
                              fontSize: 16.sp),
                          color: controller.isHovering.value ? white : purple,
                          borderSize: 2,
                          radius: 20.r,
                          height: 0.2.sh,
                          width: 200,
                        )),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
