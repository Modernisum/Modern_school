import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isPassword = true.obs;
  var pressed = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  void showPassword() {
    isPassword.value = !isPassword.value;
  }

  void press() {
    pressed.value = !pressed.value;
  }

  Future<void> login() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 2)); // Simulated API call
      Get.offAllNamed(
          '/main-screen'); // Navigate to main screen after successful login
    } catch (e) {
      Get.snackbar('Error', 'Login failed: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
