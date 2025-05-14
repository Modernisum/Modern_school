import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../classes/classes_api.dart';
import '../grades/grades_api.dart';
import '../subjects/subject_api.dart';
import 'schedulesapi.dart';

class SchedulesController extends GetxController {
  RxBool isTeacher = true.obs;
  RxBool isStudent = false.obs;
  var fileUrl = 'nothing'.obs; // Changed to camelCase

  var myClassroom = [].obs; // Changed to camelCase
  var classroomOptions = <String>[].obs;
  var selectedClassroomOptionList = <String>[].obs; // Changed to camelCase
  var selectedClassroomOption = ''.obs; // Changed to camelCase

  var weeklyList = [].obs; // Changed to camelCase
  var examList = [].obs; // Changed to camelCase

  var items = ['Teacher', 'classroom'];
  var dropdownValue = 'Teacher'.obs; // Changed to camelCase

  var items3 = ['exam', 'weekly'];
  var dropdownValue3 = 'exam'.obs; // Changed to camelCase

  var items2 = <String>[].obs;
  var dropdownValue2 = ''.obs; // Changed to camelCase

  var items4 = <String>[].obs;
  var dropdownValue4 = ''.obs; // Changed to camelCase

  var items5 = <String>[].obs;
  var dropdownValue5 = ''.obs; // Changed to camelCase

  late GradeApi gradeApi; // Declare and initialize later
  var myGrades = [].obs; // Changed to camelCase
  final gradeNameController = TextEditingController();
  final gradeFeesController = TextEditingController();

  var gradesOptions = <String>[].obs;
  var selectedGradesOptionList = <String>[].obs;
  var selectedGradesOption = 'Grade'.obs;

  var myTeachers = [].obs; // Changed to camelCase
  var teachersOptions = <String>[].obs;
  var selectedTeachersOptionList = <String>[].obs;
  var selectedTeachersOption = 'Teachers'.obs;

  var classesOptions = <String>[].obs;
  var selectedClassesOptionList = <String>[].obs; // Changed to camelCase
  var selectedClassesOption = 'Teachers'.obs;

  @override
  void onInit() async {
    super.onInit();
    gradeApi = GradeApi(); // Initialize gradeApi here
    getClassOptions(dropdownValue4.value); // Changed to camelCase
    getMyWeeklySchedules(); // Changed to camelCase
    getMyExamSchedules(); // Changed to camelCase
    getGradesOptions(); // Changed to camelCase
    getTeachersOptions();
  }

  deleteSchedule(String? id, String? classroom) async {
    await SchedulesApi.deleteschedule(id, classroom); // Changed to camelCase
    getMyWeeklySchedules(); // Changed to camelCase
    getMyExamSchedules(); // Changed to camelCase
    getGradesOptions(); // Changed to camelCase
    getTeachersOptions();
    update();
  }

  getClassOptions2(String? grade) async {
    print('getting classes options...');
    classesOptions.value = await SubjectApi.getClassroomOptions(grade);
    print('Done!');
  }

  addTeacher(String teacher, List<String> selClasses, String? grade, String? id,
      String? name) async {
    // Changed to camelCase
    print('adding teacher...');
    await SchedulesApi.addTeacher(
        teacher, selClasses, grade, id, name); // Changed to camelCase
    print('Done!');
  }

  addSchedule() async {
    print('add Schedule...');
    EasyLoading.show(
      status: 'loading...',
      dismissOnTap: true,
    );
    await SchedulesApi.addNewSchedule(
        dropdownValue.value, // Changed to camelCase
        dropdownValue3.value, // Changed to camelCase
        dropdownValue4.value, // Changed to camelCase
        dropdownValue2.value, // Changed to camelCase
        dropdownValue5.value, // Changed to camelCase
        fileUrl.value); // Changed to camelCase
    print('Done!');
    EasyLoading.showSuccess('Great Success!');
    
    // Clear form fields
    fileUrl.value = 'nothing';
    dropdownValue.value = items.isNotEmpty ? items[0] : 'Teacher';
    dropdownValue2.value = items2.isNotEmpty ? items2[0] : '';
    dropdownValue3.value = items3.isNotEmpty ? items3[0] : 'exam';
    dropdownValue4.value = items4.isNotEmpty ? items4[0] : '';
    dropdownValue5.value = items5.isNotEmpty ? items5[0] : '';
    
    // Navigate back
    Get.back();
    
    update();
  }

  getTeachersOptions() async {
    print('getting teachers options...');
    teachersOptions.value = await ClassesApi.getTeachersOptions();
    items5.value = await await ClassesApi.getTeachersOptions();
    dropdownValue5.value = items5[0]; // Changed to camelCase
    print(items4.value);
    print('Done!');
    update();
  }

  getGradesOptions() async {
    print('getting grades options...');
    gradesOptions.value = await GradeApi.getGradesOptions();
    items4.value = await GradeApi.getGradesOptions();
    dropdownValue4.value = items4[0]; // Changed to camelCase
    print(items4.value);
    print('Done!');
    update();
  }

  getClassOptions(String dropdownValue4) async {
    // Changed to camelCase
    print('getting classes options...');
    print(dropdownValue4);
    classroomOptions.value =
        await SchedulesApi.getClassroomOptions(dropdownValue4);
    items2.value = await SchedulesApi.getClassroomOptions(dropdownValue4);
    if (items2.value.isEmpty) {
    } else {
      dropdownValue2.value = items2[0]; // Changed to camelCase
    }
    print('Done!');
    update();
  }

  getMyWeeklySchedules() async {
    // Changed to camelCase
    print('getting new isTeacher ...');
    weeklyList.value = await SchedulesApi.getmyWeekly(); // Changed to camelCase
    print(weeklyList.value); // Changed to camelCase
    print('Done!');
  }

  getMyExamSchedules() async {
    // Changed to camelCase
    print('getting new isStudent ...');
    examList.value = await SchedulesApi.getmyExam(); // Changed to camelCase
    print(examList.value); // Changed to camelCase
    print('Done!');
    update();
  }

  void selectWeekly() {
    isTeacher.value = true;
    isStudent.value = false;
    update();
  }

  void selectExam() {
    isTeacher.value = false;
    isStudent.value = true;
    update();
  }

  //reset the values
  void resetValues() {
    isTeacher = true.obs;
    isStudent = false.obs;
    update();
  }

  changeValue(String? val) {
    // Changed to camelCase
    dropdownValue.value = val!; // Changed to camelCase
    update();
  }

  changeValue2(String? val) {
    // Changed to camelCase
    dropdownValue2.value = val!; // Changed to camelCase
    update();
  }

  changeValue3(String? val) {
    // Changed to camelCase
    dropdownValue3.value = val!; // Changed to camelCase
    update();
  }

  changeValue4(String? val) {
    // Changed to camelCase
    dropdownValue4.value = val!; // Changed to camelCase
    update();
  }

  changeValue5(String? val) {
    // Changed to camelCase
    dropdownValue5.value = val!; // Changed to camelCase
    update();
  }
}
