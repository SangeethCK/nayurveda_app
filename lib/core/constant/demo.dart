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
}

class AddTreatment {
  String? male;
  String? female;
  String? value;

   AddTreatment({this.male,this.female,this.value});
}
