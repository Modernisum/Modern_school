import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/bindings/login-binding.dart';
import 'package:modernschool/view/routes/app_pages.dart';
import 'package:modernschool/view/screens/announcements/announcements-controller.dart';
import 'package:modernschool/view/screens/classes/classes-controller.dart';
import 'package:modernschool/view/screens/grades/grades-controller.dart';
import 'package:modernschool/view/screens/login/login_controller.dart';
import 'package:modernschool/view/screens/main-screen/main-controller.dart';
import 'package:modernschool/view/screens/schedules/schedules-controller.dart';
import 'package:modernschool/view/screens/subjects/subjects-controller.dart';
import 'package:modernschool/view/utils/constants/constant.dart';
import 'package:modernschool/view/utils/constants/font_families.dart';
import 'package:modernschool/view/utils/constants/font_style.dart';

import 'firebase_options.dart';

// Define a global binding to initialize all controllers 
class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    // Initialize LoginController
    Get.put(LoginController(), permanent: true);
    
    // Initialize MainController
    Get.put(MainController(), permanent: true);
    
    // Initialize AnnouncementsController
    Get.put(AnnouncementsController(), permanent: true);
    
    // Initialize GradesController
    Get.put(GradesController(), permanent: true);
    
    // Initialize ClassesController
    Get.put(ClassesController(), permanent: true);
    
    // Initialize SchedulesController
    Get.put(SchedulesController(), permanent: true);
    
    // Initialize SubjectsController
    Get.put(SubjectsController(), permanent: true);
    
    // Add more controllers as needed
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Initialize global bindings immediately
  GlobalBindings().dependencies();
  
  // Configure EasyLoading
  configLoading();
  
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black // Use a simpler mask type
    ..userInteractions = false // Disable interactions to prevent input issues
    ..dismissOnTap = false;
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
        initialBinding: GlobalBindings(), // Use our global bindings here
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          // Wrap with EasyLoading
          child = EasyLoading.init()(context, child);
          return child;
        },
      ),
    );
  }
}
