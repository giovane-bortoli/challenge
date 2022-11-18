import 'package:dio/dio.dart';

import 'package:challenge/src/core/remote_data_source/api_client.dart';
import 'package:challenge/src/core/remote_data_source/api_response.dart';

class DioImpl implements ApiClient {
  final Dio dio;
  DioImpl({
    required this.dio,
  });

  @override
  Future<ApiResponse> getRequest(String path,
      {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    final response = await dio.get(path,
        queryParameters: query,
        options: Options(
          headers: headers,
          sendTimeout: 1000,
          receiveTimeout: 1000,
        ));

    return ApiResponse.fromDioResponse(response);
  }

  @override
  Future<ApiResponse> postRequest(String path,
      {Map<String, String>? body, Map<String, dynamic>? query}) async {
    final response = await dio.post(path,
        queryParameters: query,
        options: Options(
          headers: body,
          sendTimeout: 50000,
          receiveTimeout: 50000,
        ));
    return ApiResponse.fromDioResponse(response);
  }
}
