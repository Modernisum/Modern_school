import 'package:flutter/material.dart';
import 'package:modernschool/models/teacher.dart';
import 'package:modernschool/view/screens/teachers/teachers-controller.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/constants/responsive.dart';

class TeacherItem extends StatelessWidget {
  TeacherItem({super.key, required this.teacher, required this.controller});

  final Teacher teacher;
  final TeachersController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.activeAddingTeacher();
        controller.showInformation();
        controller.uploadTeacher(teacher);
        controller.uploadTeacherInformation();
      },
      child: Container(
        decoration: myDecoration,
        child: Padding(
          padding: EdgeInsets.all(Responsive.isMobile(context)
              ? defaultPadding / 2
              : defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Responsive.isDesktop(context)
                    ? 250
                    : Responsive.isTablet(context)
                        ? 200
                        : 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    '${teacher.firstName!} ${teacher.lastName!}',
                    style: redHatMediumStyle(
                        color: white,
                        fontSize: Responsive.isDesktop(context)
                            ? 28
                            : Responsive.isTablet(context)
                                ? 24
                                : 20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: Responsive.isDesktop(context) ? 52 : 32,
                  ),
                  SizedBox(
                    width: Responsive.isDesktop(context) ? 150 : 100,
                    child: Text(teacher.study.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: redHatRegularStyle(
                            color: white,
                            fontSize: Responsive.isDesktop(context) ? 16 : 12)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
