
import 'package:dio/dio.dart';
import 'package:nayurveda_app/domain/api/endpoint/api_endpoints.dart';
import 'package:nayurveda_app/domain/api/intercepters.dart';
import 'package:nayurveda_app/domain/models/rgeister/branch_list.dart';
import 'package:nayurveda_app/domain/models/rgeister/register_request.dart';
import 'package:nayurveda_app/domain/models/rgeister/treatment_response.dart';

class RegisterRepository {
  Future<List<BranchList>> branch() async {
    Response response = await NetworkProvider().get(ApiEndpoints.branchList);
    switch (response.statusCode) {
      case 200:
        return (response.data['branches'] as List)
            .map((e) => BranchList.fromJson(e))
            .toList();
      default:
        throw Exception('Error');
    }
  }
//=-=-=-= Add Register =-=-=-=

  Future<dynamic> addRegister({RegisterRequest? dataRequest}) async {
    final formData = FormData.fromMap(dataRequest?.toJson() ?? {});
    Response response =
        await NetworkProvider().post(ApiEndpoints.addRegister, data: formData);
    switch (response.statusCode) {
      case 200:
        return response.data['status'];
      default:
        throw Exception('Error');
    }
  }

  //=-==-=-=-= Treatment List =-=-=-=-
    Future<List<TreatmentLists>> treatmetLists() async {
    Response response = await NetworkProvider().get(ApiEndpoints.treatmentList);
    switch (response.statusCode) {
      case 200:
        return (response.data['treatments'] as List)
            .map((e) => TreatmentLists.fromJson(e))
            .toList();
      default:
        throw Exception('Error');
    }
  }
}
