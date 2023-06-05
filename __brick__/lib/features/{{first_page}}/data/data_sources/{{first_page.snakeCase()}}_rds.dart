import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:{{package_name}}/core/api/api_services.dart';
import 'package:{{package_name}}/core/config/app_network_urls.dart';
import 'package:{{package_name}}/core/error/app_exceptions.dart';

abstract class {{first_page.pascalCase()}}RDS {
  Future<String> {{first_page.camelCase()}}User();
}

class {{first_page.pascalCase()}}RDSImpl implements {{first_page.pascalCase()}}RDS {
  const {{first_page.pascalCase()}}RDSImpl({
    required this.apiServices,
  });

  final ApiServices apiServices;

  @override
  Future<String> {{first_page.camelCase()}}User() async {
    final Response response = await apiServices.callApi(
      type: ApiType.post,
      url: NetworkUrls.{{first_page.camelCase()}}Url,
      // data: params.toMap(),
      methodName: '{{first_page.camelCase()}}User',
    );

    if (response.statusCode == 200) {
      if (response.data['result']) {
        // return UserLogin.fromMap(response.data);
        return 'success';
      } else {
        throw StatusException(response.data['message']);
      }
    } else {
      throw ServerException();
    }
  }

}
