import 'package:dio/dio.dart';
import 'package:shop/gloabl/index.dart';
import 'dart:convert';

// 封装 dio工具类

class RequestUtils {
  static Dio dio = Dio();
  // 基础路径
  static const String baseUrl = GlobalConfig.baseUrl;
  // 超时时间
  static const int timeout = GlobalConfig.timeout;

  RequestUtils() {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: timeout),
      receiveTimeout: Duration(milliseconds: timeout),
      responseType: ResponseType.json,
      headers: {'Accept': 'application/json'},
    );
    // 拦截器
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Map<String, dynamic> _toJsonMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) {
      final decoded = jsonDecode(data);
      if (decoded is Map) return Map<String, dynamic>.from(decoded);
    }
    throw const FormatException('响应不是合法的 JSON Object');
  }

  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(url, queryParameters: queryParameters);
    return _toJsonMap(response.data);
  }
}

// 导出单例
final RequestUtils requestUtils = RequestUtils();
