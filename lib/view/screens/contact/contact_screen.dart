import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(34.h),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 550.w,
                    minWidth: 450.w,
                  ),
                  padding: EdgeInsets.all(50.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: -5,
                        blurRadius: 7,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Contact Us',
                        style: redHatBoldStyle(
                          color: purple,
                          fontSize: size.width / 29.2,
                        ),
                      ),
                      Text(
                        'We are here to help you!',
                        style: redHatMediumStyle(
                          color: lightPurple,
                          fontSize: size.width / 65,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final Uri emailUri = Uri(
                                scheme: 'mailto',
                                path: 'modernschool@modernisum.com',
                              );
                              if (await canLaunchUrl(emailUri)) {
                                await launchUrl(emailUri);
                              } else {
                                // Handle error if email client cannot be launched
                                Get.snackbar(
                                  'Error',
                                  'Could not open email client',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              }
                            },
                            child:
                                Icon(Icons.email, color: purple, size: 24.sp),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Email: modernschool@modernisum.com',
                            style: redHatMediumStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Icon(Icons.phone, color: purple, size: 24.sp),
                          SizedBox(width: 10.w),
                          Text(
                            'Phone: +91 9368671007',
                            style: redHatMediumStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final Uri websiteUri =
                                  Uri.parse('https://modernisum.com');
                              if (await canLaunchUrl(websiteUri)) {
                                await launchUrl(websiteUri,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                // Handle error if website cannot be opened
                                Get.snackbar(
                                  'Error',
                                  'Could not open website',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              }
                            },
                            child: Icon(Icons.web, color: purple, size: 24.sp),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Website: modernisum.com',
                            style: redHatMediumStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 15.h,
                            horizontal: 30.w,
                          ),
                        ),
                        child: Text(
                          'Back',
                          style: redHatMediumStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
