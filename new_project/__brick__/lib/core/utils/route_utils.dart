import 'package:flutter/material.dart';
import 'package:{{package_name}}/core/config/app_routes.dart';
import 'package:{{package_name}}/features/{{first_page}}/presentation/pages/{{first_page.snakeCase()}}_page.dart';


class RouteUtils {
  static Map<String, Widget Function(BuildContext)> routes = {

    /// Home Page
    AppRoutes.loginPage: (context) {
      return const {{first_page.pascalCase()}}Page();
    },

  };
}
