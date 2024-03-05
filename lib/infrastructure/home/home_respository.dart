
import 'package:dio/dio.dart';
import 'package:nayurveda_app/domain/api/endpoint/api_endpoints.dart';
import 'package:nayurveda_app/domain/models/home/home_response.dart';

import '../../domain/api/intercepters.dart';

class HomeRepositories {
  Future<List<PatientLists>> home() async {
    Response response = await NetworkProvider().get(ApiEndpoints.home);

    switch (response.statusCode) {
      case 200:
        return (response.data['patient'] as List)
            .map((e) => PatientLists.fromJson(e))
            .toList();
      default:
        throw Exception('Error');
    }
  }
}
