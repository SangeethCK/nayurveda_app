import 'package:nayurveda_app/presentation/widgets/dropdown/models/drop_down.dart';

class CommonFunction {
  List<DropDownValue> listOfDistrict = [
    DropDownValue(id: 1, value: 'Kasargod'),
    DropDownValue(id: 1, value: 'Kannur'),
    DropDownValue(id: 1, value: 'Kozhikode'),
    DropDownValue(id: 1, value: 'Wayanad'),
    DropDownValue(id: 1, value: 'Malappuram'),
    DropDownValue(id: 1, value: 'Thrissur'),
    DropDownValue(id: 1, value: 'Palakkad'),
    DropDownValue(id: 1, value: 'Ernakulam'),
    DropDownValue(id: 1, value: 'Alapuzha'),
    DropDownValue(id: 1, value: 'Kollam'),
    DropDownValue(id: 1, value: 'Thiruvanadapuram'),
  ];

  List<DropDownValue> date = [
    DropDownValue(id: 1, value: 'Monday'),
    DropDownValue(id: 1, value: 'Tuesday'),
    DropDownValue(id: 1, value: 'Wednesday'),
    DropDownValue(id: 1, value: 'Thurusday'),
    DropDownValue(id: 1, value: 'Friday'),
    DropDownValue(id: 1, value: 'Saturday'),
    DropDownValue(id: 1, value: 'Sunday'),
  ];

  String? validateIsEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}

class AddTreatment {
  String? male;
  String? female;
  String? value;

  AddTreatment({this.male, this.female, this.value});
}
