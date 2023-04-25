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

  Future<void> saveLoginType(String? type) async {
    if (!(type == 'email' ||
        type == 'kakao' ||
        type == 'google' ||
        type == 'naver' ||
        type == null)) {
      throw Exception();
    }

    await _storage.write(key: 'loginType', value: type);
  }

  Future<String?> readLoginType() async {
    return await _storage.read(key: 'loginType');
  }
}
