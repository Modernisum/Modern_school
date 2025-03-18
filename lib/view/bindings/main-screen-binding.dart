import 'package:get/get.dart';
import 'package:modernschool/view/screens/main-screen/main-controller.dart';

class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
