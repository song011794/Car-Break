// import 'package:json_annotation/json_annotation.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';

// part 'parking_repository.freezed.dart';

// @RestApi(baseUrl: "http://api.data.go.kr/openapi/tn_pubr_prkplce_info_api?")
// abstract class ParkingRepo {
//   factory ParkingRepo(Dio dio, {String baseUrl}) = _ParkingRepo;

//   @GET("/tasks")
//   Future<List<Task>> getTasks();
// }

// @freezed
// class Person with _$Person {
//   const factory Person({
//     required String firstName,
//     required String lastName,
//     required int age,
//   }) = _Person;

//   factory Person.fromJson(Map<String, Object?> json)
//       => _$PersonFromJson(json);
// }