
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nayurveda_app/application/auth/auth_sign.dart';
import 'package:nayurveda_app/application/auth/auth_state.dart';

class SignInProvider {
  SignInProvider._();

  static final formKey = Provider.autoDispose<GlobalKey<FormState>>((ref) {
    return GlobalKey<FormState>();
  });

  static final usernameController =
      Provider.autoDispose<TextEditingController>((ref) {
    return TextEditingController();
  });

  static final pasdController =
      Provider.autoDispose<TextEditingController>((ref) {
    return TextEditingController();
  });

  static final signInProvider =
      StateNotifierProvider<AuthNotifier, AuthState>((ref) {
    return AuthNotifier();
  });
}
