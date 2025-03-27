import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isPassword = true.obs;
  var pressed = false.obs;
  var isHovering = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  void showPassword() {
    isPassword.value = !isPassword.value;
  }

  void press() {
    pressed.value = !pressed.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
