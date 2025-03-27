import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var index = 0.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  updateIndex(int newIndex) {
    index.value = newIndex;
    update();
  }

  void controlMenu() {
    if (!scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
