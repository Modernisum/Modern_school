import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modernschool/models/schedule.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/constants/responsive.dart';
import 'package:intl/intl.dart';

import '../../../screens/schedules/schedules-controller.dart';

class ScheduleItem extends StatelessWidget {
  ScheduleItem({super.key, required this.schedule});

  final Schedule schedule;
  final DateFormat _dateFormat = DateFormat('y-MM-d');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: ValueKey<String>('schedule_${schedule.id}'),
      onLongPress: () {
        Get.defaultDialog(
            backgroundColor: backgroundColor,
            title: 'Confirm ',
            titleStyle: redHatMediumStyle(color: darkGray, fontSize: 28),
            contentPadding: EdgeInsets.all(20),
            content: Column(
              key: ValueKey<String>('schedule_dialog_${schedule.id}'),
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        final controller = Get.find<SchedulesController>();
                        controller.deleteSchedule(schedule.id, schedule.classroom);
                        controller.update();
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 110,
                        color: purple,
                        child: Center(
                          child: Text(
                            'ok',
                            style: redHatBoldStyle(color: Colors.white),
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
                            style: redHatBoldStyle(color: Colors.grey),
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
      onTap: () => {},
      child: Container(
        decoration: myDecoration,
        child: Padding(
          padding: EdgeInsets.all(Responsive.isMobile(context)
              ? defaultPadding / 2
              : defaultPadding),
          child: schedule.grade == null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${schedule.type}',
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
                        Text(
                          '${schedule.teacher}',
                          style: redHatMediumStyle(
                              color: white,
                              fontSize: Responsive.isDesktop(context)
                                  ? 15
                                  : Responsive.isTablet(context)
                                      ? 24
                                      : 20),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => {print('edit')},
                          icon: Icon(Icons.edit),
                          color: white,
                        ),
                        SizedBox(
                          height: Responsive.isDesktop(context)
                              ? 8
                              : Responsive.isTablet(context)
                                  ? 6
                                  : 4,
                        ),
                        Text(_dateFormat.format(schedule.date.toDate()),
                            style: redHatRegularStyle(
                                color: white,
                                fontSize:
                                    Responsive.isDesktop(context) ? 16 : 12)),
                      ],
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${schedule.type}',
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
                        Text(
                          'Grade ${schedule.grade}, Section ${schedule.classroom}',
                          style: redHatMediumStyle(
                              color: white,
                              fontSize: Responsive.isDesktop(context)
                                  ? 15
                                  : Responsive.isTablet(context)
                                      ? 24
                                      : 20),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => {print('edit')},
                          icon: Icon(Icons.edit),
                          color: white,
                        ),
                        SizedBox(
                          height: Responsive.isDesktop(context)
                              ? 8
                              : Responsive.isTablet(context)
                                  ? 6
                                  : 4,
                        ),
                        Text(_dateFormat.format(schedule.date.toDate()),
                            style: redHatRegularStyle(
                                color: white,
                                fontSize:
                                    Responsive.isDesktop(context) ? 16 : 12)),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
