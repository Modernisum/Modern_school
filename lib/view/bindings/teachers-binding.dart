import 'package:get/get.dart';
import 'package:modernschool/view/screens/teachers/teachers-controller.dart';

class TeachersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeachersController());
  }
}
