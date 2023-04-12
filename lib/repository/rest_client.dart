import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/coordinate_model.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/findByCoordinate')
  Future<List<ResponseCoordinateModel>> findByCoordinate(@Body() RequestCoordinateModel requestCoordinateModel);
}
