
import 'package:dio/dio.dart';
import 'package:nayurveda_app/domain/api/endpoint/api_endpoints.dart';
import 'package:nayurveda_app/domain/models/auth/auth_model.dart';

import '../../domain/api/intercepters.dart';

class AuthRepository {
  //=-=-=-=-= Login =-=-=-=-=-=

  Future<AuthResponse> login(
      {required String userName, required int password}) async {
    final formData = FormData.fromMap({
      "username": userName,
      "password": password,
    });

    Response response =
        await NetworkProvider().post(ApiEndpoints.signIn, data: formData);
    switch (response.statusCode) {
      case 200:
        return AuthResponse.fromJson(response.data);
      default:
        throw Exception('Error');
    }
  }
}
