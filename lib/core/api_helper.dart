// // ignore_for_file: deprecated_member_use

// import 'dart:developer';

// import 'package:dio/dio.dart';

// class ApiHelper {
//   // Private constructor

//   final Dio _dio = Dio();

//   Future<Response> getRequest({
//     required String url,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic>? params,
//     bool isAuthenticated = false,
//     String? token,
//   }) async {
//     try {
//       if (isAuthenticated && token != null) {
//         headers ??= {};
//         headers['Authorization'] = 'Bearer $token';
//       }

//       Options options = Options(
//         headers: headers,
//       );

//       Response response = await _dio.get(
//         url,
//         queryParameters: params,
//         options: options,
//       );

//       return response;
//     } on DioError catch (e) {
//       // Handle DioError here
//       log('Error: ${e.response?.data ?? e.message}');
//       rethrow;
//     }
//   }

//   Future<Response> postRequest({
//     required String url,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic>? data,
//     bool isAuthenticated = false,
//     String? token,
//   }) async {
//     try {
//       if (isAuthenticated && token != null) {
//         headers ??= {};
//         headers['Authorization'] = 'Bearer $token';
//       }

//       Options options = Options(
//         headers: headers,
//       );

//       Response response = await _dio.post(
//         url,
//         data: data,
//         options: options,
//       );

//       return response;
//     } on DioError catch (e) {
//       // Handle DioError here
//       log('Error: ${e.response?.data ?? e.message}');
//       rethrow;
//     }
//   }

//   Future<Response> putRequest({
//     required String url,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic>? data,
//     bool isAuthenticated = false,
//     String? token,
//   }) async {
//     try {
//       if (isAuthenticated && token != null) {
//         headers ??= {};
//         headers['Authorization'] = 'Bearer $token';
//       }

//       Options options = Options(
//         headers: headers,
//       );

//       Response response = await _dio.put(
//         url,
//         data: data,
//         options: options,
//       );

//       return response;
//     } on DioError catch (e) {
//       // Handle DioError here
//       log('Error: ${e.response?.data ?? e.message}');
//       rethrow;
//     }
//   }
// }

import '../../imports.dart';

class ApiHelper {
  final Dio _dio;
  final RequestHeaderInterceptor _headerInterceptor;

  ApiHelper()
      : _dio = Dio(),
        _headerInterceptor = RequestHeaderInterceptor() {
    _dio.interceptors.add(_headerInterceptor);
  }

  Future<Response> _executeRequest(
      Future<Response> Function() requestFunction) async {
    try {
      return await requestFunction();
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw handleError(e.toString());
    }
  }

  Future<Response> getRequest({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool isAuthenticated = false,
    String? token,
  }) async {
    return _executeRequest(() async {
      Options options = await _prepareOptions(headers, isAuthenticated, token);
      return _dio.get(url, queryParameters: params, options: options);
    });
  }

  Future<Response> postRequest({
    required String url,
    Map<String, dynamic>? headers,
    dynamic data,
    bool isAuthenticated = false,
    String? token,
  }) async {
    return _executeRequest(() async {
      Options options = await _prepareOptions(headers, isAuthenticated, token);
      return _dio.post(url, data: data, options: options);
    });
  }

  Future<Response> putRequest({
    required String url,
    Map<String, dynamic>? headers,
    dynamic data,
    bool isAuthenticated = false,
    String? token,
  }) async {
    return _executeRequest(() async {
      Options options = await _prepareOptions(headers, isAuthenticated, token);
      return _dio.put(url, data: data, options: options);
    });
  }

  Future<Response> deleteRequest({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool isAuthenticated = false,
    String? token,
  }) async {
    return _executeRequest(() async {
      Options options = await _prepareOptions(headers, isAuthenticated, token);
      return _dio.delete(url, queryParameters: params, options: options);
    });
  }

  Future<Options> _prepareOptions(
    Map<String, dynamic>? headers,
    bool isAuthenticated,
    String? token,
  ) async {
    Map<String, dynamic> customHeaders =
        await _headerInterceptor.getCustomHeaders();

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    if (isAuthenticated && token != null) {
      customHeaders['Authorization'] = 'Bearer $token';
    }

    return Options(headers: customHeaders);
  }
}
