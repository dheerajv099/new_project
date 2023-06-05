import 'package:{{package_name}}/core/objects/app_object.dart';

class AppFailureMessage {
  static const String serverFail = 'Failed to load data from Server!';
  static const String cacheFail = 'Failed to load data from Device!';
  static const String networkFailure = 'Failed to connect to internet';
  static String statusFailure =
      'Failed to load data as status received is ${ObjectStatus.error.name}';
}
