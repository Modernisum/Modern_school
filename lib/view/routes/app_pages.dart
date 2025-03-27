import 'package:get/get.dart';
import 'package:modernschool/view/bindings/login-binding.dart';
import 'package:modernschool/view/bindings/main-screen-binding.dart';
import 'package:modernschool/view/bindings/your-school-binding.dart';

import '../screens/login/login_screen.dart';
import '../screens/main-screen/main-screen.dart';
import '../screens/your-school/your-school-screen.dart';

class AppPages {
  AppPages._();
  static const login = '/login';
  static const yourSchool = '/your-school';
  static const mainScreen = '/main-screen';
  static const gradesScreen = '/grades-screen';
  static const classesScreen = '/classes-screen';
  static const subjectsScreen = '/subjects-screen';
  static const announcementsScreen = '/announcements-screen';
  static const reportsScreen = '/reports-screen';
  static const schedulesScreen = '/schedules-screen';
  static const studentsScreen = '/students-screen';
  static const teachersScreen = '/teachers-screen';

  static final pages = [
    GetPage(name: login, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(
        name: yourSchool,
        page: () => YourSchoolScreen(),
        binding: YourSchoolBinding()),
    GetPage(
        name: mainScreen,
        page: () => MainScreen(),
        binding: MainScreenBinding()),
  ];
}
