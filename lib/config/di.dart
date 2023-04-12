import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../repository/rest_client.dart';

final GetIt getIt = GetIt.I;

void setupGetIt() {  
  final dio = Dio()..options = BaseOptions(baseUrl: dotenv.get('BASE_URL'));  
  getIt.registerLazySingleton<RestClient>(() => RestClient(dio));
}
