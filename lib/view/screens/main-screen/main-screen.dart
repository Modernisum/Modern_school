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

MainController controller = Get.put(MainController());

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List pages = [
      YourSchoolScreen(),
      GradesScreen(),
      ClassesScreen(),
      SubjectsScreen(),
      StudentsScreen(),
      TeachersScreen(),
      SchedulesScreen(),
      AnnouncementsScreen(),
      ReportsAndEmailsScreen(),
    ];

    return Scaffold(
      key: navigationController.scaffoldKey,
      drawer: menu(
        size: size,
      ),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            Expanded(
                child: menu(
              size: size,
            )),
          GetBuilder(
              init: MainController(),
              builder: (MainController navigationController) {
                int index = navigationController.index.value;
                if (index >= 0 && index < pages.length) {
                  return Expanded(flex: 4, child: pages[index]);
                } else {
                  // Handle invalid index, e.g., show an error message or default to the first page
                  return Expanded(flex: 4, child: pages[0]);
                }
              })
        ],
      )),
    );
  }
}
