import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:modernschool/models/grades.dart';
import 'package:modernschool/models/student.dart';
import 'package:modernschool/models/teacher.dart';
import 'package:modernschool/view/screens/students/students-controller.dart';
import 'package:modernschool/view/screens/your-school/your_school_controller.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/constants/my_icons.dart';
import 'package:modernschool/view/utils/constants/responsive.dart';
import 'package:modernschool/view/utils/widgets/check-existing-box.dart';

class StudentItem extends StatelessWidget {
  StudentItem({
    super.key,
    required this.student,
    required this.controller,
    this.check = false,
  });

  Student student;
  StudentsController controller;
  bool check;
  @override
  Widget build(BuildContext context) {
    return !check
        ? GestureDetector(
            onTap: () {
              controller.activeAddingStudent();
              controller.showInformation();
              controller.uploadStudent(student);
              controller.uploadStudentInformation();
            },
            child: Container(
              decoration: myDecoration,
              child: Padding(
                padding: EdgeInsets.all(Responsive.isMobile(context)
                    ? defaultPadding / 2
                    : defaultPadding),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Responsive.isDesktop(context)
                              ? 200
                              : Responsive.isTablet(context)
                                  ? 150
                                  : 100,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              '${student.firstName} ${student.lastName}',
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
                        //here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${student.average}' '%',
                          style: redHatMediumStyle(
                              color: white,
                              fontSize: Responsive.isDesktop(context)
                                  ? 24
                                  : Responsive.isTablet(context)
                                      ? 20
                                      : 16),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )

        //check
        : Row(
            children: [
              Container(
                width: Responsive.isMobile(context)
                    ? 300
                    : Responsive.isTablet(context)
                        ? 400
                        : 500,
                decoration: myDecoration,
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Responsive.isDesktop(context)
                                ? 280
                                : Responsive.isTablet(context)
                                    ? 240
                                    : 200,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '${student.firstName} ${student.lastName}',
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
                          //here
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'father: ' '${student.fatherName}',
                            style: redHatMediumStyle(
                                color: white,
                                fontSize: Responsive.isDesktop(context)
                                    ? 24
                                    : Responsive.isTablet(context)
                                        ? 20
                                        : 16),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              CheckExistingBox(
                  // value: controller.isExist.value,
                  // press: () {
                  //   controller.takeExistingValue(student.exists);
                  //   controller.check();
                  //   // () {
                  //   //   student.exists = controller.isExist.value;
                  //   // };
                  // },
                  )
            ],
          );
  }
}
