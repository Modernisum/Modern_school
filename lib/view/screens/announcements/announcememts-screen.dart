import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/screens/announcements/announcements-controller.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/widgets/add-button.dart';
import 'package:modernschool/view/utils/widgets/cliackable_text.dart';
import 'package:modernschool/view/utils/widgets/items/announcement-item.dart';

import '../../utils/constants/responsive.dart';
import '../../utils/widgets/header.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AnnouncementsController>();
    Size size = MediaQuery.of(context).size;
    //var textcontroller = TextEditingController();
    return SafeArea(
      key: const ValueKey('announcements-safe-area'),
      child: SingleChildScrollView(
        key: const ValueKey('announcements-scroll-view'),
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
                  text: 'Announcemetns',
                  size: size,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: defaultPadding),
                        child: AnnouncementsOptions(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      /*GetBuilder(
                          builder: (AnnouncementsController c) {
                            return c.isStudents.value
                                ? Row(
                                    children: [
                                      Container(
                                        width: Responsive.isDesktop(context)
                                            ? size.width / 3
                                            : size.width / 2,
                                        child: DropDownMultiSelect(
                                          options: c.classroomOptions,
                                          whenEmpty: 'Class room',
                                          onChanged: (value) {
                                            c.selectedclassroomOptionList.value =
                                                value;
                                            c.selectedclassroomOption.value = '';
                                            c.selectedclassroomOptionList.value
                                                .forEach((element) {
                                              c.selectedclassroomOption.value =
                                                  c.selectedclassroomOption.value +
                                                      ' ' +
                                                      element;
                                            });
                                            c.update();
                                          },
                                          selectedValues:
                                              c.selectedclassroomOptionList.value,
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 1,
                                  );
                          }),*/
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 500,
                        width: Responsive.isDesktop(context)
                            ? size.width / 3
                            : size.width / 2,
                        child: GetBuilder<AnnouncementsController>(
                            builder: (AnnouncementsController c) {
                              return FutureBuilder(
                                  future: c.getmyAnnouncements(),
                                  builder: ((context, AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(child: Text('Loading...'));
                                    }

                                    return ((c.isPublic &
                                                c.publiclist.isEmpty) ||
                                            (c.isStudents &
                                                c.studentslist.isEmpty) ||
                                            (c.isTeachers &
                                                c.teacherslist.isEmpty))
                                        ? SizedBox(
                                            height: 460,
                                            child: Center(
                                              child: Text(
                                                'NO ANNOUNCE',
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
                                              itemCount: c.isPublic.value
                                                  ? c.publiclist.length
                                                  : c.isStudents.value
                                                      ? c.studentslist.length
                                                      : c.teacherslist.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return AnnouncementItem(
                                                  announcement: c.isPublic.value
                                                      ? c.publiclist[index]
                                                      : c.isStudents.value
                                                          ? c.studentslist[
                                                              index]
                                                          : c.teacherslist[
                                                              index],
                                                );
                                              },
                                            ),
                                          );
                                  }));
                            }),
                      ),
                    ],
                  ),
                  GetBuilder<AnnouncementsController>(
                      builder: (AnnouncementsController c) {
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
                                        title: 'Add Announcements',
                                        titleStyle: redHatMediumStyle(
                                            color: darkGray, fontSize: 28),
                                        contentPadding: EdgeInsets.all(20),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GetBuilder<AnnouncementsController>(
                                                builder:
                                                    (AnnouncementsController
                                                        ccc) {
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
                                                        value: ccc.dropdownvalue
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

                                                          print(ccc
                                                              .dropdownvalue
                                                              .value);
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
                                              controller: c.ContentController,
                                              keyboardType: TextInputType.text,
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                labelText: 'Content',
                                                hintMaxLines: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            TextField(
                                              onChanged: (value) {},
                                              controller: c.TitleController,
                                              keyboardType: TextInputType.text,
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                labelText: 'Title',
                                                hintMaxLines: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            GetBuilder<AnnouncementsController>(
                                              builder:
                                                  (AnnouncementsController c) {
                                                return c.dropdownvalue.value ==
                                                        'classroom'
                                                    ? Column(children: [
                                                        Container(
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
                                                                  .dropdownvalue4
                                                                  .value,
                                                              icon: Icon(Icons
                                                                  .keyboard_arrow_down),
                                                              items: c
                                                                  .items4
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
                                                                c.getclassOptions(
                                                                    newValue!);
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
                                                              : size.width / 2,
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
                                                                  .dropdownvalue2
                                                                  .value,
                                                              icon: Icon(Icons
                                                                  .keyboard_arrow_down),
                                                              items: c
                                                                  .items2
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
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ])
                                                    : SizedBox(height: 1);
                                              },
                                            ),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      controller.addAnnouncement();

                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: 110,
                                                      color: purple,
                                                      child: Center(
                                                        child: Text(
                                                          'submit',
                                                          style:
                                                              redHatBoldStyle(
                                                                  color: Colors
                                                                      .white),
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
                                  text: 'Add announce +'),
                              SizedBox(
                                height: Responsive.isDesktop(context) ? 28 : 16,
                              ),
                            ],
                          ),
                        );
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnnouncementsOptions extends StatelessWidget {
  const AnnouncementsOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AnnouncementsController c = Get.find<AnnouncementsController>();
    return Row(
      children: [
        ClicableText(
          text: 'public',
          style: redHatMediumStyle(
              color: c.isPublic.value ? white : gray,
              fontSize: Responsive.isDesktop(context)
                  ? 24
                  : Responsive.isTablet(context)
                      ? 20
                      : 16),
          function: c.selectPublicAnnouncements,
          activeLine: true,
          lineColor: c.isPublic.value ? Colors.white : lightGray,
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
          text: 'students',
          style: redHatMediumStyle(
              color: c.isStudents.value ? white : gray,
              fontSize: Responsive.isDesktop(context)
                  ? 24
                  : Responsive.isTablet(context)
                      ? 20
                      : 16),
          function: c.selectStudentsAnnouncements,
          activeLine: true,
          lineColor: c.isStudents.value ? Colors.white : lightGray,
          length: Responsive.isMobile(context)
              ? 72
              : Responsive.isTablet(context)
                  ? 84
                  : 104,
        ),
        SizedBox(
          width: Responsive.isMobile(context)
              ? 46
              : Responsive.isTablet(context)
                  ? 108
                  : 48,
        ),
        ClicableText(
          text: 'teachers',
          style: redHatMediumStyle(
              color: c.isTeachers.value ? white : gray,
              fontSize: Responsive.isDesktop(context)
                  ? 24
                  : Responsive.isTablet(context)
                      ? 20
                      : 16),
          function: c.selectTeachersAnnouncements,
          activeLine: true,
          lineColor: c.isTeachers.value ? Colors.white : lightGray,
          length: Responsive.isMobile(context)
              ? 72
              : Responsive.isTablet(context)
                  ? 84
                  : 104,
        ),
      ],
    );
  }
}
