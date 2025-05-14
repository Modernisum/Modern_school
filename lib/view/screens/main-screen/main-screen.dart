import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/screens/announcements/announcememts-screen.dart';
import 'package:modernschool/view/screens/classes/classes-screen.dart';
import 'package:modernschool/view/screens/grades/grades-screen.dart';
import 'package:modernschool/view/screens/main-screen/main-controller.dart';
import 'package:modernschool/view/screens/reports/reports-screen.dart';
import 'package:modernschool/view/screens/schedules/schedules-screen.dart';
import 'package:modernschool/view/screens/students/students-screen.dart';
import 'package:modernschool/view/screens/subjects/subjects-screen.dart';
import 'package:modernschool/view/screens/teachers/teachers-screen.dart';
import 'package:modernschool/view/screens/your-school/your-school-screen.dart';
import 'package:modernschool/view/utils/constants/responsive.dart';

import '../../utils/widgets/menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // Define static instances of each screen to prevent recreating them on each build
  static final List<Widget> _pages = [
    const YourSchoolScreen(),
    const GradesScreen(),
    const ClassesScreen(),
    const SubjectsScreen(),
    const StudentsScreen(),
    const TeachersScreen(),
    const SchedulesScreen(),
    const AnnouncementsScreen(),
    const ReportsAndEmailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Controller is already initialized in GlobalBindings, so we can simply find it
    final controller = Get.find<MainController>();
    
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: controller.scaffoldKey,
      drawer: menu(
        key: const ValueKey('drawer-menu'),
        size: size,
      ),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            Expanded(
                child: menu(
              key: const ValueKey('sidebar-menu'),
              size: size,
            )),
          GetBuilder<MainController>(
              builder: (controller) {
                int index = controller.index.value;
                if (index >= 0 && index < _pages.length) {
                  return Expanded(flex: 4, child: _pages[index]);
                } else {
                  // Handle invalid index, e.g., show an error message or default to the first page
                  return Expanded(flex: 4, child: _pages[0]);
                }
              })
        ],
      )),
    );
  }
}
