import 'dart:convert';

import 'package:{{package_name}}/core/utils/app_secure_data.dart';
import 'package:{{package_name}}/injection_container.dart';
import 'package:{{package_name}}/core/config/config.dart';

/// [UserData] contains all the user's confidential information
///
/// used [secureData] for store user data in device
abstract class UserData {
  Future<void> saveLocal(String key, dynamic value);
  Future<void> remove();
  Future getUserData();
}

class User extends UserData {
  final SecureData _secureData = sl();

  Future<String?> _getUserData() async {
    return await _secureData.read(HiveKey.user);
  }

  @override
  Future<void> remove() async {
    return await _secureData.delete(HiveKey.user);
  }

  @override
  Future<void> saveLocal(String key, dynamic value) async {
    return await _secureData.write(key, value);
  }

  @override
  Future getUserData() async {
    final String? userData = await _getUserData();
    if (userData != null) {
      final data = jsonDecode(userData);
      // return AppUser.fromMap(data);
    }
    return null;
  }
}
