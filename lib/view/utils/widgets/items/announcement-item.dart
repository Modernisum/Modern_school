import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modernschool/models/announcements.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:modernschool/view/utils/constants/responsive.dart';
import 'package:intl/intl.dart';

import '../../../screens/announcements/announcements-controller.dart';

class AnnouncementItem extends StatelessWidget {
  AnnouncementItem({super.key, required this.announcement});

  final Announcements announcement;
  final DateFormat _dateFormat = DateFormat('y-MM-d');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: ValueKey<String>('announcement_${announcement.id}'),
      onLongPress: () {
        Get.defaultDialog(
            backgroundColor: backgroundColor,
            title: 'Confirm ',
            titleStyle: redHatMediumStyle(color: darkGray, fontSize: 28),
            contentPadding: EdgeInsets.all(20),
            content: Column(
              key: ValueKey<String>('announcement_dialog_${announcement.id}'),
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        final controller = Get.find<AnnouncementsController>();
                        controller.deleteAnnouncement(announcement.id);
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
      onTap: () => {
        print('announcement'),
        showDialog(
          context: context,
          builder: (BuildContext) => AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style: redHatRegularStyle(
                      color: purple,
                      fontSize: Responsive.isDesktop(context) ? 16 : 12),
                ),
              )
            ],
            scrollable: true,
            title: Text('${announcement.title}',
                style: redHatRegularStyle(
                    color: gray,
                    fontSize: Responsive.isDesktop(context) ? 16 : 12)),
            content: Text('${announcement.content}',
                style: redHatRegularStyle(
                    color: gray,
                    fontSize: Responsive.isDesktop(context) ? 16 : 12)),
          ),
        )
      },
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
              Text(
                '${announcement.title}',
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
                  Text(_dateFormat.format(announcement.date.toDate()),
                      style: redHatRegularStyle(
                          color: white,
                          fontSize: Responsive.isDesktop(context) ? 16 : 12)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
