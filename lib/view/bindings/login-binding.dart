import 'package:get/get.dart';
import 'package:modernschool/view/screens/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
