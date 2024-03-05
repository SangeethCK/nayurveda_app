// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nayurveda_app/application/auth/auth_state.dart';
import 'package:nayurveda_app/core/routes/routes.dart';
import 'package:nayurveda_app/infrastructure/auth/auth_respository.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState()) {
    loadToken();
  }
  final storage = const FlutterSecureStorage();

  Future<void> setToken(String token) async {
    try {
      await storage.write(key: 'token', value: token);
    } catch (e) {
      log('Error loading token: $e');
    }
  }

  Future<String?> loadToken() async {
    try {
      final token = await storage.read(key: 'token');
      state = state.copyWith(token: token);
      return token;
    } catch (e) {
      log('Error loading token: $e');
      return null;
    }
  }

  Future<void> login({
    required String userName,
    required int password,
    required BuildContext context,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await AuthRepository().login(
        userName: userName,
        password: password,
      );

      if (response.status == true) {
        state = state.copyWith(
          authResponse: response,
          token: response.token,
        );
        await setToken(response.token ?? '');

        final NavigatorState navigator = Navigator.of(context);
        navigator.pushNamedAndRemoveUntil(
          home,
          ModalRoute.withName(initialRoutes),
        );
      }

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}
