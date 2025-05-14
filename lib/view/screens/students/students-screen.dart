import 'package:expandable_search_bar/expandable_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/screens/students/students-controller.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/widgets/add-button.dart';
import 'package:modernschool/view/utils/widgets/items/student-item.dart';

import '../../utils/constants/responsive.dart';
import '../../utils/widgets/header.dart';
import '../../utils/widgets/select-menu.dart';
import 'add_student_screen.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var textcontroller = TextEditingController();
    return SafeArea(
      child: GetBuilder<StudentsController>(
          init: StudentsController(),
          builder: (StudentsController studentsController) {
            return !studentsController.isAdding.value
                ? SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Column(
                        children: [
                          Responsive(
                            mobile: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: Header(
                                    text: 'Students',
                                    size: size,
                                  ),
                                ),
                                ExpandableSearchBar(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 4,
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                  width: size.width * 0.8,
                                  iconBackgroundColor: purple,
                                  iconColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  onTap: () {
                                    print(
                                      studentsController.searchController.text
                                          .toString(),
                                    );
                                    studentsController.getmyStudents();
                                    studentsController.refresh();
                                  },
                                  hintText: "Enter first name",
                                  editTextController:
                                      studentsController.searchController,
                                ),
                              ],
                            ),
                            tablet: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: defaultPadding * 2,
                                    ),
                                    child: Header(
                                      text: 'Students',
                                      size: size,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 45),
                                  child: ExpandableSearchBar(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 4,
                                        blurRadius: 2,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    width: 250,
                                    iconBackgroundColor: purple,
                                    iconColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {
                                      print(
                                        studentsController.searchController.text
                                            .toString(),
                                      );
                                      studentsController.getmyStudents();
                                      studentsController.refresh();
                                    },
                                    hintText: "Enter first name",
                                    editTextController:
                                        studentsController.searchController,
                                  ),
                                ),
                              ],
                            ),
                            desktop: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: defaultPadding * 3,
                                    ),
                                    child: Header(
                                      text: 'Students',
                                      size: size,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 45),
                                  child: ExpandableSearchBar(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 4,
                                        blurRadius: 2,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    width: 300,
                                    iconBackgroundColor: purple,
                                    iconColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {
                                      print(
                                        studentsController.searchController.text
                                            .toString(),
                                      );
                                      studentsController.getmyStudents();
                                      studentsController.refresh();
                                    },
                                    hintText: "Enter first name",
                                    editTextController:
                                        studentsController.searchController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GetBuilder(
                                        init: StudentsController(),
                                        builder: (StudentsController c) {
                                          return Responsive(
                                            mobile: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                  width: size.width * 0.8,
                                                  child: DropDownSelectingMenu(
                                                      selectedOption:
                                                          studentsController
                                                              .selectedGrade2.value,
                                                      selectOptions:
                                                          studentsController
                                                              .selectGradeOptions2,
                                                      setSelectedOption:
                                                          studentsController
                                                              .selectGradeOptions2,
                                                      enableEdit: studentsController
                                                              .showInfo.value
                                                          ? studentsController
                                                                  .isEditing.value
                                                              ? true
                                                              : false
                                                          : true),
                                                ),
                                                SizedBox(height: 10),
                                                SizedBox(
                                                  height: 50,
                                                  width: size.width * 0.8,
                                                  child: DropDownSelectingMenu(
                                                      selectedOption:
                                                          studentsController
                                                              .selectedClass2.value,
                                                      selectOptions:
                                                          studentsController
                                                              .selectClassOptions2,
                                                      setSelectedOption:
                                                          studentsController
                                                              .selectClassOptions2,
                                                      enableEdit: studentsController
                                                              .showInfo.value
                                                          ? studentsController
                                                                  .isEditing.value
                                                              ? true
                                                              : false
                                                          : true),
                                                ),
                                              ],
                                            ),
                                            tablet: Row(
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                  width: 200,
                                                  child: DropDownSelectingMenu(
                                                      selectedOption:
                                                          studentsController
                                                              .selectedGrade2.value,
                                                      selectOptions:
                                                          studentsController
                                                              .selectGradeOptions2,
                                                      setSelectedOption:
                                                          studentsController
                                                              .selectGradeOptions2,
                                                      enableEdit: studentsController
                                                              .showInfo.value
                                                          ? studentsController
                                                                  .isEditing.value
                                                              ? true
                                                              : false
                                                          : true),
                                                ),
                                                SizedBox(width: 20),
                                                SizedBox(
                                                  height: 50,
                                                  width: 200,
                                                  child: DropDownSelectingMenu(
                                                      selectedOption:
                                                          studentsController
                                                              .selectedClass2.value,
                                                      selectOptions:
                                                          studentsController
                                                              .selectClassOptions2,
                                                      setSelectedOption:
                                                          studentsController
                                                              .selectClassOptions2,
                                                      enableEdit: studentsController
                                                              .showInfo.value
                                                          ? studentsController
                                                                  .isEditing.value
                                                              ? true
                                                              : false
                                                          : true),
                                                ),
                                              ],
                                            ),
                                            desktop: Row(
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                  width: 200,
                                                  child: DropDownSelectingMenu(
                                                      selectedOption:
                                                          studentsController
                                                              .selectedGrade2.value,
                                                      selectOptions:
                                                          studentsController
                                                              .selectGradeOptions2,
                                                      setSelectedOption:
                                                          studentsController
                                                              .selectGradeOptions2,
                                                      enableEdit: studentsController
                                                              .showInfo.value
                                                          ? studentsController
                                                                  .isEditing.value
                                                              ? true
                                                              : false
                                                          : true),
                                                ),
                                                SizedBox(width: 20),
                                                SizedBox(
                                                  height: 50,
                                                  width: 200,
                                                  child: DropDownSelectingMenu(
                                                      selectedOption:
                                                          studentsController
                                                              .selectedClass2.value,
                                                      selectOptions:
                                                          studentsController
                                                              .selectClassOptions2,
                                                      setSelectedOption:
                                                          studentsController
                                                              .selectClassOptions2,
                                                      enableEdit: studentsController
                                                              .showInfo.value
                                                          ? studentsController
                                                                  .isEditing.value
                                                              ? true
                                                              : false
                                                          : true),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                    SizedBox(
                                      height: 35.h,
                                    ),
                                    SizedBox(
                                      height: 500,
                                      width: Responsive.isDesktop(context)
                                          ? size.width / 3
                                          : Responsive.isTablet(context)
                                              ? size.width / 2
                                              : size.width * 0.9,
                                      child: GetBuilder(
                                          init: StudentsController(),
                                          builder: (StudentsController c) {
                                            return FutureBuilder(
                                                future: c.getmyStudents(),
                                                builder: ((context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot.connectionState ==
                                                      ConnectionState.waiting) {
                                                    return Center(
                                                        child: Text('Loading...'));
                                                  }

                                                  return c.mystudents.isEmpty
                                                      ? SizedBox(
                                                          height: 500,
                                                          child: Center(
                                                            child: Text(
                                                              'NO Students',
                                                              style:
                                                                  redHatBoldStyle(
                                                                      color:
                                                                          lightGray,
                                                                      fontSize: Responsive.isDesktop(
                                                                              context)
                                                                          ? 52
                                                                          : Responsive.isTablet(
                                                                                  context)
                                                                              ? 40
                                                                              : 32),
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox(
                                                          height: 500,
                                                          width: Responsive.isDesktop(context)
                                                              ? size.width / 3
                                                              : Responsive.isTablet(context)
                                                                  ? size.width / 2
                                                                  : size.width * 0.9,
                                                          child: ListView.separated(
                                                            separatorBuilder:
                                                                (context, index) =>
                                                                    SizedBox(
                                                              height: 32,
                                                            ),
                                                            itemCount: c.mystudents
                                                                .value.length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return StudentItem(
                                                                student: c
                                                                    .mystudents
                                                                    .value[index],
                                                                controller:
                                                                    studentsController,
                                                              );
                                                            },
                                                          ),
                                                        );
                                                }));
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              Responsive(
                                mobile: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: AddButton(
                                    press: () {
                                      studentsController
                                          .activeAddingStudent();
                                    },
                                    text: 'Add Student +',
                                  ),
                                ),
                                tablet: Padding(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Column(
                                    children: [
                                      AddButton(
                                          press: () {
                                            studentsController
                                                .activeAddingStudent();
                                          },
                                          text: 'Add Student +'),
                                      SizedBox(height: 16),
                                    ],
                                  ),
                                ),
                                desktop: Padding(
                                  padding: EdgeInsets.only(right: 80),
                                  child: Column(
                                    children: [
                                      AddButton(
                                          press: () {
                                            studentsController
                                                .activeAddingStudent();
                                          },
                                          text: 'Add Student +'),
                                      SizedBox(height: 28),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : AddStudentScreen(
                    controller: studentsController,
                  );
          }),
    );
  }
}
