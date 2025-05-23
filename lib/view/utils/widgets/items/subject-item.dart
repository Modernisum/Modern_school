import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:modernschool/models/subject.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/constants/responsive.dart';

import '../../../screens/schedules/schedules-controller.dart';

class SubjectItem extends StatelessWidget {
  SubjectItem({super.key, required this.subject});

   final Subject subject;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => {print('grade')},
      child: Container(
        decoration: myDecoration,
        child: Padding(
          padding: EdgeInsets.all(Responsive.isMobile(context)
              ? defaultPadding / 2
              : defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${subject.name}',
                    style: redHatMediumStyle(
                        color: white,
                        fontSize: Responsive.isDesktop(context)
                            ? 28
                            : Responsive.isTablet(context)
                                ? 24
                                : 20),
                  ),
                  SizedBox(
                    height: Responsive.isDesktop(context)
                        ? 8
                        : Responsive.isTablet(context)
                            ? 6
                            : 4,
                  ),
                  subject.teachersname == null
                      ? SizedBox(
                          height: 1,
                        )
                      : Text(
                          '${subject.teachersname}',
                          style: redHatMediumStyle(
                              color: white,
                              fontSize: Responsive.isDesktop(context)
                                  ? 10
                                  : Responsive.isTablet(context)
                                      ? 15
                                      : 10),
                        ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text('Add teacher',
                          style: redHatRegularStyle(
                              color: white,
                              fontSize:
                                  Responsive.isDesktop(context) ? 14 : 8)),
                      SizedBox(
                        height: Responsive.isDesktop(context)
                            ? 8
                            : Responsive.isTablet(context)
                                ? 6
                                : 4,
                      ),
                      IconButton(
                        onPressed: () => {
                          Get.defaultDialog(
                              backgroundColor: backgroundColor,
                              title: 'Add Teacher',
                              titleStyle: redHatMediumStyle(
                                  color: darkGray, fontSize: 28),
                              contentPadding: EdgeInsets.all(20),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GetBuilder(
                                    init: SchedulesController(),
                                    builder: (SchedulesController c) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 10),
                                        width: Responsive.isDesktop(context)
                                            ? size.width / 3
                                            : size.width / 2,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: lightGray, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: white,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            hint: Text(
                                              "selectedOption",
                                              style: redHatMediumStyle(
                                                  color: gray,
                                                  fontSize:
                                                      Responsive.isDesktop(
                                                              context)
                                                          ? 24
                                                          : Responsive.isTablet(
                                                                  context)
                                                              ? 20
                                                              : 16),
                                            ),
                                            value: c.dropdownValue5.value,
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            items: c.items5
                                                .map((String items) {
                                              return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items));
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              c.changeValue5(newValue);

                                              print(c.dropdownValue5.value);

                                              //  c.update();
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  GetBuilder(
                                    init: SchedulesController(),
                                    builder: (SchedulesController c) {
                                      return FutureBuilder(
                                          future:
                                              c.getClassOptions2(subject.grade),
                                          builder: ((context,
                                              AsyncSnapshot snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                  child: Text('Loading...'));
                                            }

                                            return SizedBox(
                                              width:
                                                  Responsive.isDesktop(context)
                                                      ? size.width / 3
                                                      : size.width / 2,
                                              child: DropDownMultiSelect(
                                                options: c.classesOptions,
                                                whenEmpty: 'Chose Classes',
                                                onChanged: (value) {
                                                  c.selectedClassesOptionList
                                                      .value = value;
                                                  c.selectedClassesOption
                                                      .value = '';
                                                  for (var element in c
                                                      .selectedClassesOptionList
                                                      .toList()) {
                                                    c.selectedClassesOption
                                                            .value =
                                                        '${c.selectedClassesOption.value} $element';
                                                  }

                                                  print(c
                                                      .selectedClassesOptionList
                                                      .toList());
                                                },
                                                selectedValues: c
                                                    .selectedClassesOptionList
                                                    .toList(),
                                              ),
                                            );
                                          }));
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
                                        GetBuilder(
                                            init: SchedulesController(),
                                            builder: (SchedulesController c) {
                                              return InkWell(
                                                onTap: () async {
                                                  c.addTeacher(
                                                      c.dropdownValue5.value,
                                                      c.selectedClassesOptionList
                                                          .toList(),
                                                      subject.grade,
                                                      subject.id,
                                                      subject.name);
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
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                        SizedBox(
                                          height: 20.0,
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
                              radius: 10.0)
                        },
                        icon: Icon(
                          Icons.add_box,
                          size: 20,
                        ),
                        color: white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Responsive.isDesktop(context)
                        ? 8
                        : Responsive.isTablet(context)
                            ? 6
                            : 4,
                  ),
                  Text('Grade ${subject.grade}',
                      style: redHatRegularStyle(
                          color: white,
                          fontSize: Responsive.isDesktop(context) ? 16 : 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
