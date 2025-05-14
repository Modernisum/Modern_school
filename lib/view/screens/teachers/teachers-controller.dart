import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:modernschool/view/screens/teachers/teachers_api.dart';

import '../../../models/teacher.dart';

class TeachersController extends GetxController {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var studyController = TextEditingController();
  var specializationController = TextEditingController();
  var universityController = TextEditingController();
  var graduateYearController = TextEditingController();
  var additionalInfoController = TextEditingController();
  var teacherGradesController = TextEditingController()
    ..text = 'Grade1, Grade2, Grade3, Grade4, Grade5';
  Teacher? teacherInfo;
  var isEditing = false.obs;
  var isAdding = false.obs;
  var isDeleting = false.obs;
  var showInfo = false.obs;

  List<String> subjectsOptions = ['1', '2', '3'];
  var selectedsubjectsOptionList = [''].obs;
  var selectedsubjectsOption = ''.obs;

  var myteachers = [].obs;

  @override
  void onInit() {
    getmyTeachers();
  }

  addTeacher() async {
    print('adding teacher...');
    EasyLoading.show(
      status: 'loading...',
      dismissOnTap: true,
    );
    await TeachersApi.addingTeacher(
      firstNameController.text,
      lastNameController.text,
      emailController.text,
      phoneNumberController.text,
      studyController.text,
      specializationController.text,
      universityController.text,
      graduateYearController.text,
      additionalInfoController.text,
    );
    print('Done!');
    EasyLoading.showSuccess('Great Success!');
    
    // Clear all form fields
    stopUploadingInfo();
    
    // Navigate back to previous page
    unactiveAddingTeacher();
    
    // Reset any other states
    isEditing.value = false;
    showInfo.value = false;
    
    update();
  }

  getmyTeachers() async {
    print('getting teahers ...');
    myteachers.value = await TeachersApi.getTeachers();

    print('Done!');
  }

  void uploadTeacher(Teacher teacher) {
    teacherInfo = teacher;
  }

  void uploadTeacherInformation() {
    firstNameController = TextEditingController()
      ..text = teacherInfo!.firstName!;
    lastNameController = TextEditingController()..text = teacherInfo!.lastName!;
    emailController = TextEditingController()..text = teacherInfo!.email!;
    phoneNumberController = TextEditingController()
      ..text = teacherInfo!.phoneNumber.toString();
    studyController = TextEditingController()..text = teacherInfo!.study!;
    specializationController = TextEditingController()
      ..text = teacherInfo!.specializtion!;
    universityController = TextEditingController()
      ..text = teacherInfo!.university!;
    graduateYearController = TextEditingController()
      ..text = teacherInfo!.graduateYear!;
    additionalInfoController = TextEditingController()
      ..text = teacherInfo!.additional!;
    teacherGradesController = TextEditingController()
      ..text = teacherInfo!.grades!.join(', ').toString();
    teacherGradesController = TextEditingController()
      ..text = teacherInfo!.subjects!.join(', ').toString();
  }

  void stopUploadingInfo() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    studyController.clear();
    specializationController.clear();
    universityController.clear();
    graduateYearController.clear();
    additionalInfoController.clear();
    teacherGradesController.clear();
  }

  void deleting() {
    isDeleting.value = !isDeleting.value;
    update();
  }

  void activeAddingTeacher() {
    isAdding.value = true;
    update();
  }

  void unactiveAddingTeacher() {
    isAdding.value = false;
    update();
  }

  void enableEditing() {
    isEditing.value = true;
    update();
  }

  void disableEditing() {
    isEditing.value = false;
    update();
  }

  void showInformation() {
    showInfo.value = true;
  }

  void unShowInformation() {
    showInfo.value = false;
  }

  var selectedSubject = "Subject".obs;
  final selectSubjectOptions = ['1', '2', '3'];
  void setSelectedSubject(value) {
    selectedSubject.value = value;
    update();
  }
}
