import 'package:challenge/src/core/remote_data_source/api_response.dart';

abstract class ApiClient {
  Future<ApiResponse> getRequest(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });

  Future<ApiResponse> postRequest(
    String path, {
    Map<String, String>? body,
    Map<String, dynamic>? query,
  });
}
