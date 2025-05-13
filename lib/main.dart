import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/bindings/login-binding.dart';
import 'package:modernschool/view/routes/app_pages.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_families.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920), // Define your design size
      minTextAdapt: true, // Enable minimum text adaptation
      splitScreenMode: true, // Enable split screen mode
      builder: (context, child) => GetMaterialApp(
        title: 'Modern School',
        theme: ThemeData(
          fontFamily: RedHatDisplay.light,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: white,
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: lightGray, width: 3),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: lightPurple, width: 3),
            ),
            labelStyle: redHatMediumStyle(color: gray, fontSize: 24),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: lightPurpleSwatch)
              .copyWith(surface: Colors.white),
          // Here color  will be change in to purple
        ),
        initialRoute: AppPages.login,
        initialBinding: LoginBinding(),
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
      ),
    );
  }
}
