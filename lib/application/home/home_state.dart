import 'package:nayurveda_app/domain/models/home/home_response.dart';

class HomeState {
  final bool isLoading;
  final bool isError;
  final bool status;
  final String message;
  final Map errors;
  List<PatientLists>? patientList;

  HomeState({
    this.isLoading = false,
    this.isError = false,
    this.status = false,
    this.message = '',
    this.errors = const {},
    this.patientList,
  });

  HomeState copyWith({
    bool? isLoading,
    bool? isError,
    bool? status,
    String? message,
    String? verificationId,
    Map? errors,
    List<PatientLists>? patientList,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      status: status ?? this.status,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      patientList: patientList ?? this.patientList,
    );
  }
}
