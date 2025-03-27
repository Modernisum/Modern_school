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

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isForgotPassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void Login() async {
    String res = "Some error occurred";

    try {
      final querySnapshot = await _firestore.collection('admin').get();
      bool isValidUser = querySnapshot.docs.any((doc) =>
          doc['email'] == controller.emailController.text &&
          doc['password'] == controller.passwordController.text);

      if (isValidUser) {
        res = "success";
      } else {
        res = "Invalid email or password";
      }
    } catch (err) {
      res = "Error: ${err.toString()}";
    }

    if (res == "success") {
      Get.toNamed(AppPages.mainScreen);
    } else {
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Pics pics = Pics();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background2.jpg"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(34.h),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Stack(
                        children: [
                          Visibility(
                            visible: isForgotPassword,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 550.w,
                                minWidth: 450.w,
                                maxHeight: 700.h,
                              ),
                              padding: EdgeInsets.all(50.h),
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
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Modern School',
                                        style: redHatBoldStyle(
                                            color: purple,
                                            fontSize: size.width / 25),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        'Enjoy Managing Your School',
                                        style: redHatMediumStyle(
                                            color: lightPurple,
                                            fontSize: size.width / 60),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.h),
                                  Text(
                                    'Forgot Password',
                                    style: redHatBoldStyle(
                                        color: purple,
                                        fontSize: size.width / 29.2),
                                  ),
                                  SizedBox(height: 20.h),
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
                                  SizedBox(height: 20.h),
                                  CustomButton(
                                    press: () {
                                      print('Reset Password');
                                    },
                                    height: 50.h,
                                    width: size.width / 2,
                                    radius: 20.r,
                                    text: 'Reset Password',
                                  ),
                                  SizedBox(height: 20.h),
                                  ClicableText(
                                    text: 'Back to Login',
                                    style: sfRegularStyle(
                                        color: purple, fontSize: 20.sp),
                                    function: () {
                                      setState(() {
                                        isForgotPassword = false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !isForgotPassword,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 550.w,
                                minWidth: 450.w,
                                maxHeight: 1500.h,
                              ),
                              padding: EdgeInsets.all(50.h),
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
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30.w, vertical: 15.h),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(15.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Modern School',
                                          style: redHatBoldStyle(
                                              color: purple,
                                              fontSize: size.width / 25),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          'Enjoy Managing Your School',
                                          style: redHatMediumStyle(
                                              color: lightPurple,
                                              fontSize: size.width / 60),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40.h),
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
                                  SizedBox(height: 52.h),
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
                                  SizedBox(height: 32.h),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: ClicableText(
                                      text: 'Forgot Password?',
                                      style: sfRegularStyle(
                                          color: purple, fontSize: 20.sp),
                                      function: () {
                                        setState(() {
                                          isForgotPassword = true;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 100.h),
                                  CustomButton(
                                    press: () {
                                      Login();
                                    },
                                    height: 100.h,
                                    width: 300.w,
                                    radius: 20.r,
                                    text: 'Login',
                                  ),
                                  SizedBox(height: 50.h)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h, left: size.width / 48),
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
                            color: controller.isHovering.value
                                ? Colors.white
                                : purple,
                            fontSize: 20),
                        color: controller.isHovering.value
                            ? purple
                            : Colors.transparent,
                        borderSize: 5,
                        radius: 20.r,
                      )),
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
