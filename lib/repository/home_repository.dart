import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect/connect.dart';

class HomeRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = dotenv.get('BASE_URL');
  }

  Future<Response> findByCoordinate(Map data) =>
      post('/findByCoordinate', data);
}
