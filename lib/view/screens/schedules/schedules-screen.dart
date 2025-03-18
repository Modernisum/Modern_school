import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/screens/schedules/schedules-controller.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';

import '../../utils/constants/responsive.dart';
import '../../utils/constants/utils.dart';
import '../../utils/widgets/add-button.dart';
import '../../utils/widgets/cliackable_text.dart';
import '../../utils/widgets/header.dart';
import '../../utils/widgets/items/secheduleitem.dart';

File? file;
UploadTask? sch;

class SchedulesScreen extends StatelessWidget {
  const SchedulesScreen({super.key});

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
                            : defaultPadding),
                child: Header(
                  text: 'Schedules',
                  size: size,
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: defaultPadding),
                        child: SchedulesOptions(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 460,
                        width: Responsive.isDesktop(context)
                            ? size.width / 3
                            : size.width / 2,
                        child: GetBuilder(
                            init: SchedulesController(),
                            builder: (SchedulesController c) {
                              return FutureBuilder(
                                  future: c.getMyWeeklySchedules(),
                                  builder: ((context, AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(child: Text('Loading...'));
                                    }

                                    return ((c.isTeacher &
                                                c.weeklyList.isEmpty) ||
                                            (c.isStudent & c.examList.isEmpty))
                                        ? SizedBox(
                                            height: 460,
                                            child: Center(
                                              child: Text(
                                                'NO Schedules',
                                                style: redHatBoldStyle(
                                                    color: lightGray,
                                                    fontSize: Responsive
                                                            .isDesktop(context)
                                                        ? 52
                                                        : Responsive.isTablet(
                                                                context)
                                                            ? 40
                                                            : 32),
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            height: 460,
                                            width: Responsive.isDesktop(context)
                                                ? size.width / 3
                                                : size.width / 2,
                                            child: ListView.separated(
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
                                                height: 32,
                                              ),
                                              itemCount: c.isTeacher.value
                                                  ? c.weeklyList.length
                                                  : c.examList.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ScheduleItem(
                                                    schedule: c.isTeacher.value
                                                        ? c.weeklyList[index]
                                                        : c.examList[index]);
                                              },
                                            ),
                                          );
                                  }));
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 55.w,
                  ),
                  GetBuilder(
                      init: SchedulesController(),
                      builder: (SchedulesController c) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: Responsive.isDesktop(context)
                                  ? 40
                                  : Responsive.isTablet(context)
                                      ? 20
                                      : 0),
                          child: Column(
                            children: [
                              AddButton(
                                  press: () {
                                    Get.defaultDialog(
                                        backgroundColor: backgroundColor,
                                        title: 'Add Schedule',
                                        titleStyle: redHatMediumStyle(
                                            color: darkGray, fontSize: 28),
                                        contentPadding: EdgeInsets.all(20),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GetBuilder(
                                                init: SchedulesController(),
                                                builder:
                                                    (SchedulesController ccc) {
                                                  return Container(
                                                    padding: EdgeInsets.only(
                                                        left: 20, right: 10),
                                                    width: Responsive.isDesktop(
                                                            context)
                                                        ? size.width / 3
                                                        : size.width / 2,
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
                                                      child: DropdownButton<
                                                          String>(
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
                                                        value: ccc.dropdownValue
                                                            .value,
                                                        icon: Icon(Icons
                                                            .keyboard_arrow_down),
                                                        items: ccc.items.map(
                                                            (String items) {
                                                          return DropdownMenuItem(
                                                              value: items,
                                                              child:
                                                                  Text(items));
                                                        }).toList(),
                                                        onChanged:
                                                            (String? newValue) {
                                                          ccc.changeValue(
                                                              newValue);
                                                          ccc.update();

                                                          print(ccc
                                                              .dropdownValue
                                                              .value);
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                }),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            GetBuilder(
                                                init: SchedulesController(),
                                                builder:
                                                    (SchedulesController c) {
                                                  return Container(
                                                    padding: EdgeInsets.only(
                                                        left: 20, right: 10),
                                                    width: Responsive.isDesktop(
                                                            context)
                                                        ? size.width / 3
                                                        : size.width / 2,
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
                                                      child: DropdownButton<
                                                          String>(
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
                                                        value: c.dropdownValue3
                                                            .value,
                                                        icon: Icon(Icons
                                                            .keyboard_arrow_down),
                                                        items: c.items3.map(
                                                            (String items) {
                                                          return DropdownMenuItem(
                                                              value: items,
                                                              child:
                                                                  Text(items));
                                                        }).toList(),
                                                        onChanged:
                                                            (String? newValue) {
                                                          c.changeValue3(
                                                              newValue);
                                                          //   c.update();

                                                          print(c.dropdownValue3
                                                              .value);
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                }),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            GetBuilder(
                                              init: SchedulesController(),
                                              builder: (SchedulesController c) {
                                                return c.dropdownValue.value ==
                                                        'classroom'
                                                    ? Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 10),
                                                            width: Responsive
                                                                    .isDesktop(
                                                                        context)
                                                                ? size.width / 3
                                                                : size.width /
                                                                    2,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color:
                                                                      lightGray,
                                                                  width: 3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: white,
                                                            ),
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton<
                                                                      String>(
                                                                hint: Text(
                                                                  "selectedOption",
                                                                  style: redHatMediumStyle(
                                                                      color: gray,
                                                                      fontSize: Responsive.isDesktop(context)
                                                                          ? 24
                                                                          : Responsive.isTablet(context)
                                                                              ? 20
                                                                              : 16),
                                                                ),
                                                                value: c
                                                                    .dropdownValue4
                                                                    .value,
                                                                icon: Icon(Icons
                                                                    .keyboard_arrow_down),
                                                                items: c.items4
                                                                    .value
                                                                    .map((String
                                                                        items) {
                                                                  return DropdownMenuItem(
                                                                      value:
                                                                          items,
                                                                      child: Text(
                                                                          items));
                                                                }).toList(),
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  c.changeValue4(
                                                                      newValue);

                                                                  print(c
                                                                      .dropdownValue4
                                                                      .value);

                                                                  c.getClassOptions(c
                                                                      .dropdownValue4
                                                                      .value);

                                                                  c.update();
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 10),
                                                            width: Responsive
                                                                    .isDesktop(
                                                                        context)
                                                                ? size.width / 3
                                                                : size.width /
                                                                    2,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color:
                                                                      lightGray,
                                                                  width: 3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: white,
                                                            ),
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton<
                                                                      String>(
                                                                hint: Text(
                                                                  "selectedOption",
                                                                  style: redHatMediumStyle(
                                                                      color: gray,
                                                                      fontSize: Responsive.isDesktop(context)
                                                                          ? 24
                                                                          : Responsive.isTablet(context)
                                                                              ? 20
                                                                              : 16),
                                                                ),
                                                                value: c
                                                                    .dropdownValue2
                                                                    .value,
                                                                icon: Icon(Icons
                                                                    .keyboard_arrow_down),
                                                                items: c.items2
                                                                    .value
                                                                    .map((String
                                                                        items) {
                                                                  return DropdownMenuItem(
                                                                      value:
                                                                          items,
                                                                      child: Text(
                                                                          items));
                                                                }).toList(),
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  c.changeValue2(
                                                                      newValue);

                                                                  print(c
                                                                      .dropdownValue2
                                                                      .value);

                                                                  //    c.update();
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20,
                                                                right: 10),
                                                        width: Responsive
                                                                .isDesktop(
                                                                    context)
                                                            ? size.width / 3
                                                            : size.width / 2,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: lightGray,
                                                              width: 3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: white,
                                                        ),
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton<
                                                              String>(
                                                            hint: Text(
                                                              "selectedOption",
                                                              style: redHatMediumStyle(
                                                                  color: gray,
                                                                  fontSize: Responsive.isDesktop(context)
                                                                      ? 24
                                                                      : Responsive.isTablet(context)
                                                                          ? 20
                                                                          : 16),
                                                            ),
                                                            value: c
                                                                .dropdownValue5
                                                                .value,
                                                            icon: Icon(Icons
                                                                .keyboard_arrow_down),
                                                            items: c
                                                                .items5.value
                                                                .map((String
                                                                    items) {
                                                              return DropdownMenuItem(
                                                                  value: items,
                                                                  child: Text(
                                                                      items));
                                                            }).toList(),
                                                            onChanged: (String?
                                                                newValue) {
                                                              c.changeValue5(
                                                                  newValue);

                                                              print(c
                                                                  .dropdownValue5
                                                                  .value);

                                                              //  c.update();
                                                            },
                                                          ),
                                                        ),
                                                      );
                                              },
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            GetBuilder(
                                                init: SchedulesController(),
                                                builder:
                                                    (SchedulesController c) {
                                                  return InkWell(
                                                    onTap: () async {
                                                      c.fileUrl.value =
                                                          await selectfile();

                                                      print("ffffffffffff");
                                                      print(c.fileUrl.value);
                                                      if (c.fileUrl.value !=
                                                          'nothing') {
                                                        AwesomeDialog(
                                                          width: 350.w,
                                                          context: context,
                                                          animType: AnimType
                                                              .leftSlide,
                                                          headerAnimationLoop:
                                                              false,
                                                          dialogType: DialogType
                                                              .success,
                                                          showCloseIcon: true,
                                                          title: 'Succes',
                                                          desc: 'File uploaded',
                                                          btnOkOnPress: () {
                                                            debugPrint(
                                                                'OnClcik');
                                                          },
                                                          btnOkIcon: Icons
                                                              .check_circle,
                                                          onDismissCallback:
                                                              (type) {
                                                            debugPrint(
                                                                'Dialog Dissmiss from callback $type');
                                                          },
                                                        ).show();
                                                      }

                                                      c.update();
                                                    },
                                                    child: Container(
                                                      height: 120.h,
                                                      padding: EdgeInsets.only(
                                                          left: 60, right: 60),
                                                      color: lightPurple,
                                                      child: Center(
                                                        child: Text(
                                                          c.fileUrl.value ==
                                                                  'nothing'
                                                              ? 'Choose file'
                                                              : 'Select new file',
                                                          style:
                                                              redHatBoldStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  GetBuilder(
                                                      init:
                                                          SchedulesController(),
                                                      builder:
                                                          (SchedulesController
                                                              c) {
                                                        return InkWell(
                                                          onTap: () async {
                                                            if (c.fileUrl
                                                                    .value ==
                                                                'nothing') {
                                                              showSnackBar(
                                                                  'Please select a file',
                                                                  context);
                                                            } else {
                                                              c.addSchedule();
                                                            }

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
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                  InkWell(
                                                    onTap: () {
                                                      c.fileUrl.value =
                                                          'nothing';
                                                      c.update();
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: 110,
                                                      color: Colors.white,
                                                      child: Center(
                                                        child: Text(
                                                          'cancel',
                                                          style:
                                                              redHatBoldStyle(
                                                                  color: Colors
                                                                      .grey),
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
                                  text: 'Add schedule +'),
                              SizedBox(
                                height: Responsive.isDesktop(context) ? 28 : 16,
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> selectfile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null && result.files.isNotEmpty) {
      final fileBytes = result.files.first.bytes;
      final fileName = result.files.first.name;

      // upload file
      final snapshot = await FirebaseStorage.instance
          .ref('uploads/$fileName')
          .putData(fileBytes!);

      final urlDownload = await snapshot.ref.getDownloadURL();
      print('Download-link : $urlDownload');
      return urlDownload;
    } else {
      return 'nothing';
    }
  }
}

class SchedulesOptions extends StatelessWidget {
  const SchedulesOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SchedulesController(),
        builder: (SchedulesController c) {
          return Row(
            children: [
              ClicableText(
                text: 'Teacher',
                style: redHatMediumStyle(
                    color: c.isTeacher.value ? purple : gray,
                    fontSize: Responsive.isDesktop(context)
                        ? 24
                        : Responsive.isTablet(context)
                            ? 20
                            : 16),
                function: c.selectWeekly,
                activeLine: true,
                lineColor: c.isTeacher.value ? lightPurple : lightGray,
                length: Responsive.isMobile(context)
                    ? 48
                    : Responsive.isTablet(context)
                        ? 60
                        : 72,
              ),
              SizedBox(
                width: Responsive.isMobile(context)
                    ? 46
                    : Responsive.isTablet(context)
                        ? 108
                        : 48,
              ),
              ClicableText(
                text: 'Student',
                style: redHatMediumStyle(
                    color: c.isStudent.value ? purple : gray,
                    fontSize: Responsive.isDesktop(context)
                        ? 24
                        : Responsive.isTablet(context)
                            ? 20
                            : 16),
                function: c.selectExam,
                activeLine: true,
                lineColor: c.isStudent.value ? lightPurple : lightGray,
                length: Responsive.isMobile(context)
                    ? 72
                    : Responsive.isTablet(context)
                        ? 84
                        : 104,
              ),
            ],
          );
        });
  }
}
