
import 'package:nayurveda_app/core/constant/demo.dart';
import 'package:nayurveda_app/domain/models/rgeister/branch_list.dart';
import 'package:nayurveda_app/domain/models/rgeister/treatment_response.dart';
import 'package:nayurveda_app/presentation/widgets/dropdown/models/drop_down.dart';

class RegisterState {
  final bool isLoading;
  final bool isError;
  final bool status;
  final String message;
  final Map errors;
  final int maleCount;
  final int femaleCount;
  final List<BranchList>? branchList;
  List<DropDownValue>? branchData;
  List<AddTreatment>? addTreatment;
  final List<TreatmentLists>? treamnetList;
  List<DropDownValue>? treatmentData;
  DropDownValue? selectedTreatment;
  DropDownValue? selectedLocation;
  DropDownValue ?selectedBranch;

  RegisterState(
      {this.isLoading = false,
      this.isError = false,
      this.status = false,
      this.message = '',
      this.errors = const {},
      this.branchList,
      this.maleCount = 0,
      this.femaleCount = 0,
      this.addTreatment,
      this.branchData,
      this.treamnetList,
      this.selectedTreatment,
      this.selectedBranch,
      this.selectedLocation,
      this.treatmentData});

  RegisterState copyWith({
    bool? isLoading,
    bool? isError,
    bool? status,
    String? message,
    String? verificationId,
    Map? errors,
    List<BranchList>? branchList,
    List<DropDownValue>? branchData,
    List<AddTreatment>? addTreatment,
    int? maleCount,
    int? femaleCount,
    final List<TreatmentLists>? treamnetList,
    List<DropDownValue>? treatmentData,
    DropDownValue? selectedTreatment,
      DropDownValue? selectedLocation,
  DropDownValue ?selectedBranch,
  }) {
    return RegisterState(
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        branchList: branchList ?? this.branchList,
        maleCount: maleCount ?? this.maleCount,
        femaleCount: femaleCount ?? this.femaleCount,
        branchData: branchData ?? this.branchData,
        addTreatment: addTreatment ?? this.addTreatment,
        treamnetList: treamnetList ?? this.treamnetList,
        treatmentData: treatmentData ?? this.treatmentData,
        selectedBranch: selectedBranch??this.selectedBranch,
        selectedLocation: selectedLocation?? this.selectedLocation,
        selectedTreatment: selectedTreatment ?? this.selectedTreatment);
  }
}
