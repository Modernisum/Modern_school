import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:modernschool/view/screens/subjects/subjects-controller.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/widgets/add-button.dart';
import 'package:modernschool/view/utils/widgets/items/subject-item.dart';

import '../../utils/constants/responsive.dart';
import '../../utils/widgets/header.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: Responsive.isDesktop(context)
                      ? defaultPadding * 3
                      : Responsive.isTablet(context)
                          ? defaultPadding * 2
                          : defaultPadding,
                ),
                child: Header(
                  text: 'subjects',
                  size: size,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    GetBuilder<SubjectsController>(
                        init: SubjectsController(),
                        builder: (SubjectsController c) {
                          return SizedBox(
                            width: Responsive.isDesktop(context)
                                ? size.width / 3
                                : size.width / 2,
                            child: DropDownMultiSelect(
                              options: c.gradesOptions,
                              whenEmpty: 'Grade',
                              onChanged: (value) {
                                c.selectedGradesOptionList.value = value;
                                c.selectedGradesOption.value = '';
                                for (var element
                                    in c.selectedGradesOptionList.toList()) {
                                  c.selectedGradesOption.value =
                                      '${c.selectedGradesOption.value} $element';
                                }

                                c.ok.value = false;
                                if (c.selectedGradesOptionList.isEmpty) {
                                  c.ok.value = true;
                                }
                                c.update();
                              },
                              selectedValues:
                                  c.selectedGradesOptionList.toList(),
                            ),
                          );
                        }),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 500,
                      width: Responsive.isDesktop(context)
                          ? size.width / 3
                          : size.width / 2,
                      child: GetBuilder<SubjectsController>(
                          init: SubjectsController(),
                          builder: (SubjectsController c) {
                            return FutureBuilder(
                              future: c.getmySubjects(),
                              builder: ((context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(child: Text('Loading...'));
                                }
                                return c.mysubjects.isEmpty
                                    ? SizedBox(
                                        height: 500,
                                        child: Center(
                                          child: Text(
                                            'NO Subjects',
                                            style: redHatBoldStyle(
                                                color: lightGray,
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
                                            : size.width / 2,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                            height: 32,
                                          ),
                                          itemCount: c.mysubjects.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return SubjectItem(
                                              subject: c.mysubjects[index],
                                            );
                                          },
                                        ),
                                      );
                              }),
                            );
                          }),
                    ),
                  ]),
                  GetBuilder<SubjectsController>(
                    init: SubjectsController(),
                    builder: (SubjectsController c) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: Responsive.isDesktop(context)
                                ? 80
                                : Responsive.isTablet(context)
                                    ? 40
                                    : 1),
                        child: Column(
                          children: [
                            AddButton(
                                press: () {
                                  Get.defaultDialog(
                                      backgroundColor: backgroundColor,
                                      title: 'Add Subject',
                                      titleStyle: redHatMediumStyle(
                                          color: darkGray, fontSize: 28),
                                      contentPadding: EdgeInsets.all(20),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GetBuilder<SubjectsController>(
                                              init: SubjectsController(),
                                              builder:
                                                  (SubjectsController ccc) {
                                                return Container(
                                                  padding: EdgeInsets.only(
                                                      left: 20, right: 10),
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: lightGray,
                                                        width: 3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: white,
                                                  ),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      hint: Text(
                                                        "selectedOption",
                                                        style:
                                                            redHatMediumStyle(
                                                                color: gray,
                                                                fontSize: Responsive
                                                                        .isDesktop(
                                                                            context)
                                                                    ? 24
                                                                    : Responsive.isTablet(
                                                                            context)
                                                                        ? 20
                                                                        : 16),
                                                      ),
                                                      value: ccc
                                                          .dropdownvalue.value,
                                                      icon: Icon(Icons
                                                          .keyboard_arrow_down),
                                                      items: ccc.items
                                                          .map((String items) {
                                                        return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(items));
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                        ccc.changevalue(
                                                            newValue);

                                                        print(
                                                            ccc.dropdownvalue);
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            onChanged: (value) {},
                                            controller: c.subjectNameController,
                                            keyboardType: TextInputType.text,
                                            maxLines: 1,
                                            decoration: InputDecoration(
                                              labelText: 'Name',
                                              hintMaxLines: 1,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          GetBuilder<SubjectsController>(
                                            init: SubjectsController(),
                                            builder: (SubjectsController c) {
                                              return SizedBox(
                                                width: Responsive.isDesktop(
                                                        context)
                                                    ? size.width / 3
                                                    : size.width / 2,
                                                child: DropDownMultiSelect(
                                                  options: c.teachersOptions,
                                                  whenEmpty: 'Chose Teachers',
                                                  onChanged: (value) {
                                                    c.selectedTeachersOptionList
                                                        .value = value;
                                                    c.selectedTeachersOption
                                                        .value = '';
                                                    for (var element in c
                                                        .selectedTeachersOptionList) {
                                                      c.selectedTeachersOption
                                                              .value =
                                                          '${c.selectedTeachersOption.value} $element';
                                                    }

                                                    c.update();
                                                    print(c
                                                        .selectedTeachersOptionList);
                                                  },
                                                  selectedValues: c
                                                      .selectedTeachersOptionList
                                                      .toList(),
                                                ),
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    SubjectsController cc =
                                                        Get.find<
                                                            SubjectsController>();
                                                    cc.addSubject();
                                                    // c.update();
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 110,
                                                    color: purple,
                                                    child: Center(
                                                      child: Text(
                                                        'submit',
                                                        style: redHatBoldStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 110,
                                                    color: Colors.white,
                                                    child: Center(
                                                      child: Text(
                                                        'cancel',
                                                        style: redHatBoldStyle(
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      radius: 10.0);
                                },
                                text: 'Add Subject +'),
                          ],
                        ),
                      );
                    },
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
