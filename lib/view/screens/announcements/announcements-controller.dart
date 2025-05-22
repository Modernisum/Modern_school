import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../grades/grades_api.dart';
import '../schedules/schedulesapi.dart';
import 'announcememtsapi.dart';

class AnnouncementsController extends GetxController {
  RxBool isPublic = true.obs;
  RxBool isStudents = false.obs;
  RxBool isTeachers = false.obs;

  var myclassroom = [].obs;
  var classroomOptions = <String>[].obs;
  var selectedclassroomOptionList = <String>[].obs;
  var selectedclassroomOption = ''.obs;
  var publiclist = [].obs;
  var studentslist = [].obs;
  var teacherslist = [].obs;

  final ContentController = TextEditingController();
  final TitleController = TextEditingController();

  var items = <String>[].obs;
  var dropdownvalue = ''.obs;

  var items2 = <String>[].obs;
  var dropdownvalue2 = ''.obs;

  var items3 = <String>[].obs;
  var dropdownvalue3 = ''.obs;

  var gradesOptions = <String>[].obs;
  var selectedGradesOptionList = <String>[].obs;
  var selectedGradesOption = 'Grade'.obs;

  var items4 = <String>[].obs;
  var dropdownvalue4 = ''.obs;

  var items5 = <String>[].obs;
  var dropdownvalue5 = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getmyAnnouncements();
    getmyAnnouncementsTe();
    getmyAnnouncementsSt();
    getclassOptions(dropdownvalue4.value);
    getgradesOptions();
    items.value = ['Option 1', 'Option 2', 'Option 3'];
    items2.value = ['Option 1', 'Option 2', 'Option 3'];
    items3.value = ['Option 1', 'Option 2', 'Option 3'];
    items4.value = ['Option 1', 'Option 2', 'Option 3'];
    items5.value = ['Option 1', 'Option 2', 'Option 3'];
  }

  deleteAnnouncement(String? id) async {
    await AnnouncememtsApi.deleteannouncement(id);
    getmyAnnouncements();
    getmyAnnouncementsTe();
    getmyAnnouncementsSt();
    update();
  }

  addAnnouncement() async {
    //Get.back();
    print('add Announcement...');
    await AnnouncememtsApi.addAnnouncememtapi(
        dropdownvalue.value,
        ContentController.text,
        TitleController.text,
        dropdownvalue2.value,
        dropdownvalue4.value);
    print('Done!');
    
    // Clear form fields
    ContentController.clear();
    TitleController.clear();
    dropdownvalue.value = items.isNotEmpty ? items[0] : '';
    dropdownvalue2.value = items2.isNotEmpty ? items2[0] : '';
    dropdownvalue4.value = items4.isNotEmpty ? items4[0] : '';
    
    // Navigate back
    Get.back();
    
    update();
  }

  changeValue(String? newValue) {
    if (newValue != null) {
      dropdownvalue.value = newValue;
      update();
    }
  }

  changeValue2(String? newValue) {
    if (newValue != null) {
      dropdownvalue2.value = newValue;
      update();
    }
  }

  changeValue3(String? newValue) {
    if (newValue != null) {
      dropdownvalue3.value = newValue;
      update();
    }
  }

  changeValue4(String? newValue) {
    if (newValue != null) {
      dropdownvalue4.value = newValue;
      update();
    }
  }

  changeValue5(String? newValue) {
    if (newValue != null) {
      dropdownvalue5.value = newValue;
      update();
    }
  }

  getnewAnnouncements(List<String> seclasses) async {
    print('getting new Announcements ...');
    studentslist.value = await AnnouncememtsApi.getNewAnnouncements(
        selectedclassroomOptionList);
    print(studentslist);
    print('Done!');
    update();
  }

  getgradesOptions() async {
    print('getting grades options...');
    gradesOptions.value = await GradeApi.getGradesOptions();
    items4.value = await GradeApi.getGradesOptions();
    dropdownvalue4.value = items4[0];
    print(items4);
    print('Done!');
    update();
  }

  getclassOptions(String dropdownvalue4) async {
    print('getting classes options...');
    print(dropdownvalue4);
    classroomOptions.value =
        await SchedulesApi.getClassroomOptions(dropdownvalue4);
    items2.value = await SchedulesApi.getClassroomOptions(dropdownvalue4);
    if (items2.isEmpty) {
    } else {
      dropdownvalue2.value = items2[0];
    }
    print('Done!');
    update();
  }

  getmyAnnouncements() async {
    print('getting new Announcements ...');
    publiclist.value = await AnnouncememtsApi.getAnnouncements();
    print(publiclist.toList());
    print('Done!');
  }

  getmyAnnouncementsTe() async {
    print('getting new TAnnouncements ...');
    teacherslist.value = await AnnouncememtsApi.getTeachersAnnouncements();
    print(teacherslist);
    print('Done!');
    update();
  }

  getmyAnnouncementsSt() async {
    print('getting new SAnnouncements ...');
    studentslist.value = await AnnouncememtsApi.getStudentsAnnouncements();
    print(studentslist);
    print('Done!');
    update();
  }

  void selectPublicAnnouncements() {
    isPublic.value = true;
    isStudents.value = false;
    isTeachers.value = false;
    update();
  }

  void selectStudentsAnnouncements() {
    isPublic.value = false;
    isStudents.value = true;
    isTeachers.value = false;
    getmyAnnouncementsSt();
    update();
  }

  void selectTeachersAnnouncements() {
    isPublic.value = false;
    isStudents.value = false;
    isTeachers.value = true;
    getmyAnnouncementsTe();

    update();
  }

//reset the values
  void resetValues() {
    isPublic = true.obs;
    isStudents = false.obs;
    isTeachers = false.obs;
    update();
  }
}
