import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecretStorage {
  // Create storage
  final _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: 'accessToken', value: accessToken);
  }

  Future<String?> readAccessToken() async {
    return await _storage.read(key: 'accessToken');
  }
}
