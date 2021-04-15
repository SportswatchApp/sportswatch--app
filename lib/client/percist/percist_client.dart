import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String?> get(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> set(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<bool> contains(String key) async {
    return await _storage.containsKey(key: key);
  }

}
