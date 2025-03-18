import 'package:get/get.dart';
import 'package:modernschool/view/screens/your-school/your_school_controller.dart';

class YourSchoolBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => YourSchoolController());
  }
}
