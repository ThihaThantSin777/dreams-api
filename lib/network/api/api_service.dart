import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dreams_dictionary/network/api/api_constant.dart';

import '../response/dreams_response.dart';

class JsonEncodedConverter extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    response.data = (response.data is String) ? jsonDecode(response.data) : response.data;
    super.onResponse(response, handler);
  }
}

class ApiService {
  late Dio _dio;

  ApiService._() {
    _dio = Dio(BaseOptions(baseUrl: kBaseURL));
    _dio.interceptors.add(JsonEncodedConverter());
  }

  static final ApiService _singleton = ApiService._();

  factory ApiService() => _singleton;

  Future<DreamsResponse?> getDreamsContent() => _dio.get(kDreamsEndpoint).then((value) {
        return DreamsResponse.fromJson(value.data as Map<String, dynamic>);
      });
}
