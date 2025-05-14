import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modernschool/models/grades.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/constants/responsive.dart';

import '../../../screens/grades/grades-controller.dart';

class GradeItem extends StatelessWidget {
  // GradesController controller = Get.put<GradesController>(GradesController());
  GradeItem({super.key, required this.grade});

  Grade grade;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: ValueKey<String>('grade_${grade.name}'),
      onTap: () => {print('grade')},
      child: Container(
        key: ValueKey<String>('grade_container_${grade.name}'),
        decoration: myDecoration,
        child: Padding(
          padding: EdgeInsets.all(Responsive.isMobile(context)
              ? defaultPadding / 2
              : defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${grade.name}',
                style: redHatMediumStyle(
                    color: white,
                    fontSize: Responsive.isDesktop(context)
                        ? 28
                        : Responsive.isTablet(context)
                            ? 24
                            : 20),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GetBuilder(
                      init: GradesController(),
                      builder: (GradesController controller) {
                        return IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                                backgroundColor: backgroundColor,
                                title: 'Confirm ',
                                titleStyle: redHatMediumStyle(
                                    color: darkGray, fontSize: 28),
                                contentPadding: EdgeInsets.all(20),
                                content: Column(
                                  key: ValueKey<String>('grade_dialog_${grade.name}'),
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.find<GradesController>()
                                                .deletegrade(grade.name);
                                            Get.find<GradesController>()
                                                .update();
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 110,
                                            color: purple,
                                            child: Center(
                                              child: Text(
                                                'ok',
                                                style: redHatBoldStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.0,
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
                                  ],
                                ),
                                radius: 10.0);
                          },
                          icon: Icon(Icons.delete),
                          color: white,
                        );
                      }),
                  SizedBox(
                    height: Responsive.isDesktop(context)
                        ? 8
                        : Responsive.isTablet(context)
                            ? 6
                            : 4,
                  ),
                  Text('${grade.numberofclasses}' ' class',
                      style: redHatRegularStyle(
                          color: white,
                          fontSize: Responsive.isDesktop(context) ? 16 : 12)),
                  Text(
                    '${grade.numberofstudents}' ' student',
                    style: redHatRegularStyle(
                        color: white,
                        fontSize: Responsive.isDesktop(context) ? 16 : 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
