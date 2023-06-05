import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureData {
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  Future<String?> read(String key) async {
    String? value = await _storage.read(key: key);
    return value;
  }

  Future<void> write(String key, value) async {
    final val = await _storage.write(key: key, value: value);
    return val;
  }

  Future<Map<String, String>?> readAll() async {
    Map<String, String>? value = await _storage.readAll();
    return value;
  }

  Future<void> delete(String key) async {
    final value = await _storage.delete(key: key);
    return value;
  }

  Future<void> deleteAll() async {
    final value = await _storage.deleteAll();
    return value;
  }
}
