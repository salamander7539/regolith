import 'package:dio/dio.dart';
import 'package:regolith/data/model/api_dto.dart';


class CoreApi {
  final Dio _dio = Dio();

  final baseUrl = 'https://sandbox.skill-branch.ru/dashboards';

  String get gradeUrl => '$baseUrl/grade';

  String get refillUrl => '$baseUrl/refill';

  String get profitUrl => '$baseUrl/profit';

  String get bonusUrl => '$baseUrl/bonus';

  final String token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwZTBhNzU2NTBlZmYwM2M4NGU3ZTA1YiIsInJvbGUiOiJzdXBlcmFkbWluIiwib3duZXIiOiJzdXBlcmFkbWluIiwiaWF0IjoxNjI1NDA1NDA1LCJleHAiOjE2MjYwMTAyMDV9.B6Y2JXfF28g62QdQCf577L3sLMcAOY95RSKhcCGWrXU';

  Options get headers => Options(headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Authorization': token,
  });

  Future<ApiDTO> getRequest(String url) async {

    ApiDTO? result;

    try {
      final response = await _dio.get(
        url,
        options: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        result = ApiDTO(response: response.data);
      } else {
        result = ApiDTO(error: response.data!['detail'].toString());
      }
    } catch (e) {
      result = ApiDTO(error: e.toString());
    }
    return result;
  }
}