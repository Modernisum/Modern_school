import 'package:get/get.dart';
import 'package:modernschool/view/screens/login/login_controller.dart';
import 'package:modernschool/view/screens/schedules/schedules-controller.dart';

class SchedulesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SchedulesController());
  }
}
