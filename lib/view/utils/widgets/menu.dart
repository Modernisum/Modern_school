import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/screens/main-screen/main-controller.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';

import '../constants/constant.dart';
import '../constants/my_icons.dart';
import 'drawer-list-item.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find<MainController>();
    return Container(
      decoration: BoxDecoration(
        gradient: gradientColor,
        image: DecorationImage(
            image: AssetImage(controlBackground), fit: BoxFit.cover),
      ),
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          key: const ValueKey('menu-scroll-view'),
          child: Column(
            key: const ValueKey('menu-main-column'),
            children: [
              DrawerHeader(
                  key: const ValueKey('menu-drawer-header'),
                  child: Padding(
                    key: const ValueKey('menu-header-padding'),
                    padding: EdgeInsets.only(top: defaultPadding * 3),
                    child: Text(
                      'Modern School',
                      style: redHatBoldStyle(color: white, fontSize: 32),
                    ),
                  )),
              Column(
                  key: const ValueKey('menu-items-column'),
                  children: [
                DarwerListItem(
                    key: const ValueKey('menu-item-school'),
                    title: 'Your School',
                    icon: MyIcons.school,
                    press: () {
                      controller.updateIndex(0);
                      controller.closeDrawer();
                    }),
                DarwerListItem(
                    key: const ValueKey('menu-item-grades'),
                    title: 'Grades',
                    icon: MyIcons.grade,
                    press: () {
                      controller.updateIndex(1);
                      controller.closeDrawer();
                    }),
                DarwerListItem(
                    key: const ValueKey('menu-item-classes'),
                    title: 'Classes',
                    icon: MyIcons.class_icon,
                    press: () {
                      controller.updateIndex(2);
                      controller.closeDrawer();
                    }),
                DarwerListItem(
                    key: const ValueKey('menu-item-subjects'),
                    title: 'Subjects',
                    icon: MyIcons.subject,
                    press: () {
                      controller.updateIndex(3);
                      controller.closeDrawer();
                    }),
                DarwerListItem(
                    key: const ValueKey('menu-item-students'),
                    title: 'Students',
                    icon: MyIcons.student,
                    press: () {
                      controller.updateIndex(4);
                      controller.closeDrawer();
                    }),
                DarwerListItem(
                    key: const ValueKey('menu-item-teachers'),
                    title: 'Teachers',
                    icon: MyIcons.student,
                    press: () {
                      controller.updateIndex(5);
                      controller.closeDrawer();
                    }),
                DarwerListItem(
                    key: const ValueKey('menu-item-schedules'),
                    title: 'Schedules',
                    icon: MyIcons.schedule,
                    press: () {
                      controller.updateIndex(6);
                      controller.closeDrawer();
                    }),
                DarwerListItem(
                    key: const ValueKey('menu-item-announcements'),
                    title: 'Announcements',
                    icon: MyIcons.announcements,
                    press: () {
                      controller.updateIndex(7);
                      controller.closeDrawer();
                    }),
                DarwerListItem(
                    key: const ValueKey('menu-item-reports'),
                    title: 'Reports',
                    icon: MyIcons.reports,
                    press: () {
                      controller.updateIndex(8);
                      controller.closeDrawer();
                    }),
                SizedBox(height: size.height / 15),
                DarwerListItem(
                    key: const ValueKey('menu-item-contact'),
                    title: 'Contact Us', 
                    icon: MyIcons.contact_us, 
                    press: () {})
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class menu extends MenuWidget {
  const menu({
    Key? key,
    required Size size,
  }) : super(key: key, size: size);
}
