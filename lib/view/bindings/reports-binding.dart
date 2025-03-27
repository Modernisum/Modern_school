import 'package:get/get.dart';
import 'package:modernschool/view/screens/reports/reports-controller.dart';

class ReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsAndEmailsController());
  }
}
