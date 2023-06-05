
import 'package:dio/dio.dart';
import 'package:{{package_name}}/core/user/user.dart';

class DioInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['content-type'] = 'application/json';
    // if(UserInfo.isLoggedIn) {
    //   options.headers['Authorization'] = 'Bearer ${UserInfo.accessToken}';
    // }
    // log('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // log('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // log('ERROR[${err.response?.statusCode}] => MESSAGE: ${err.message}');
    super.onError(err, handler);
  }
}