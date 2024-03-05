
import 'package:nayurveda_app/domain/models/auth/auth_model.dart';

class AuthState {
  final bool isLoading;
  final bool isError;
  final bool status;
  final String message;
  final String? token;
  final Map errors;
  AuthResponse? authResponse;

  AuthState({
    this.isLoading = false,
    this.isError = false,
    this.status = false,
    this.token,
    this.message = '',
    this.errors = const {},
    this.authResponse,
  });

  AuthState copyWith( {
    bool? isLoading,
    bool? isError,
    bool? status,
    String? message,
    String? verificationId,
    int? resendToken,
    Map? errors,
    String? token,
    AuthResponse? authResponse,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      status: status ?? this.status,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      authResponse: authResponse ?? this.authResponse,
      token: token ??this.token
    );
  }
}
