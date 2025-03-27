import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:modernschool/view/screens/grades/grades-controller.dart';

class GradeSelector extends StatelessWidget {
  GradeSelector(
      {super.key,
      required this.options,
      required this.selectedOption,
      required this.selectedOptionList});
  List<String> options;
  Rx<List<String>> selectedOptionList;
  var selectedOption;

  @override
  Widget build(BuildContext context) {
    return DropDownMultiSelect(
      options: options,
      whenEmpty: 'Grade',
      onChanged: (value) {
        selectedOptionList.value = value;
        selectedOption.value = '';
        for (var element in selectedOptionList.value) {
          selectedOption.value = selectedOption.value + ' ' + element;
        }
      },
      selectedValues: selectedOptionList.value,
    );
  }
}
