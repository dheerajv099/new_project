import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class NetworkUrls {
  /// Secure Information
  static String? apiKey;

  /// Base URL of API
  static final String _baseUrl = dotenv.get('BASE_API');

  static String get baseUrl => _baseUrl;

  /// USer login url
  static String {{first_page.camelCase()}}Url = '{{first_page.snakeCase()}}';

}
