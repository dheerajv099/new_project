import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:{{package_name}}/core/api/dio_interceptor.dart';
import 'package:{{package_name}}/core/config/app_network_urls.dart';

/// [ApiType] Type of APIs which help in select type
/// when call [ApiServices.callApi(type: ApiType.get, url: url)]
enum ApiType { get, post, put, multipartPost }

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: NetworkUrls.baseUrl,
    );
    dio.interceptors.add(DioInterceptor());
  }

  Future<Response> callApi({
    required ApiType type,
    required String url,
    dynamic data,

    /// [methodName] is not necessary, it will use
    ///
    /// for showing Method or feature name
    String? methodName,
  }) async {
    /// To print API data into console change [logging] to `true`
    /// also setup interceptor
    // TODO(jenis): set [logging] to `false` in Release mode
    bool logging = false;
    late Response response;

    if (type == ApiType.get) {
      if (logging) {
        log('$methodName : $url', name: 'API.URL.GET');
      }
      response = await dio.get(url);
      if (logging) {
        log('$methodName : ${jsonEncode(response.data)}',
            name: 'API.RESPONSE.GET');
      }
    }

    if (type == ApiType.post) {
      if (logging) {
        log('$methodName : $url', name: 'API.URL.POST');
        if (methodName != 'orderReturn') {
          log('$methodName : ${json.encode(data)}', name: 'API.PARAMS.POST');
        }
      }

      response = await dio.post(url, data: data);
      if (logging) {
        log('$methodName : ${jsonEncode(response.data)}',
            name: 'API.RESPONSE.POST');
      }
    }

    if (type == ApiType.put) {
      response = await dio.put(url, data: data);
    }

    return response;
  }
}
