import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get/instance_manager.dart';
import 'package:shop_app_mobile/core/controller/base/connectivity_controller.dart';
import 'package:shop_app_mobile/core/utils/log.dart';

class DioService {
  late Dio _dio;

  DioService() {
    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      maxStale: const Duration(days: 1),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
    final options = BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        validateStatus: (status) => status! < 500);
    _dio = Dio(options);

    _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
    _dio.interceptors.add(RetryInterceptor(
      dio: _dio,
      logPrint: (message) {
        Log.debugPrint(message);
      },
      retries: 3,
      retryDelays: [
        const Duration(seconds: 3),
        const Duration(seconds: 5),
        const Duration(seconds: 7),
      ],
    ));
  }

  Future<dynamic> get(Uri url) async {
    dio.Response response;
    try {
      final urlOP = url.origin + url.path;
      response = await _dio.get(urlOP, queryParameters: url.queryParameters);
      return _returnResponse(response);
    } catch (e) {
      //  Add catch
    }
  }

  Future<dynamic> post(Uri url, {Object? body}) async {
    dio.Response response;
    try {
      final urlOP = url.origin + url.path;
      response = await _dio.post(urlOP,
          options: Options(responseType: ResponseType.json),
          queryParameters: url.queryParameters,
          data: jsonEncode(body));
      return _returnResponse(response);
    } catch (e) {
      //  Add catch
    }
  }

  Future<dynamic> put(Uri url, {Object? body}) async {
    dio.Response response;
    try {
      final urlOP = url.origin + url.path;
      response = await _dio.put(urlOP,
          options: Options(responseType: ResponseType.json),
          queryParameters: url.queryParameters,
          data: jsonEncode(body));
      return _returnResponse(response);
    } catch (e) {
      //  Add catch
    }
  }

  Future<dynamic> delete(Uri url, {Object? body}) async {
    dio.Response response;
    try {
      response = await _dio.deleteUri(
        url,
        options: Options(responseType: ResponseType.json),
        data: jsonEncode(body),
      );
      return _returnResponse(response);
    } catch (e) {
      //  Add catch
    }
  }

  dynamic _returnResponse(dio.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        final jsonResponse = response.data;
        return jsonResponse;
      case 204:
        return null;
      case 400:
      case 403:
      case 404:
      case 405:
        badRequestLog(response);
      case 401:
        break;
    }
  }

  void badRequestLog(dio.Response response) {
    Log.debugPrint({
      'statusMessage': '${response.statusMessage}',
      'data': '${response.data}',
      'path': response.requestOptions.path,
      'queryParameters': '${response.requestOptions.queryParameters}',
      'requestOptionsData': 'val${response.requestOptions.data}ue2',
    });
  }

  void checkServerConnection(dynamic error) {
    final controller = Get.find<ConnectivityController>();
    controller.isFailServer.value = true;
  }
}
