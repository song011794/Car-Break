// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestCoordinateModel _$$_RequestCoordinateModelFromJson(
        Map<String, dynamic> json) =>
    _$_RequestCoordinateModel(
      latitude_bound: (json['latitude_bound'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      longitude_bound: (json['longitude_bound'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_RequestCoordinateModelToJson(
        _$_RequestCoordinateModel instance) =>
    <String, dynamic>{
      'latitude_bound': instance.latitude_bound,
      'longitude_bound': instance.longitude_bound,
    };

_$_ResponseCoordinateModel _$$_ResponseCoordinateModelFromJson(
        Map<String, dynamic> json) =>
    _$_ResponseCoordinateModel(
      prkplceNo: json['prkplceNo'] as String,
      rdnmadr: json['rdnmadr'] as String?,
      lnmadr: json['lnmadr'] as String?,
      enforceSe: json['enforceSe'] as String?,
      operDay: json['operDay'] as String?,
      weekdayOperOpenHhmm: json['weekdayOperOpenHhmm'] as String?,
      weekdayOperColseHhmm: json['weekdayOperColseHhmm'] as String?,
      satOperOperOpenHhmm: json['satOperOperOpenHhmm'] as String?,
      satOperCloseHhmm: json['satOperCloseHhmm'] as String?,
      holidayOperOpenHhmm: json['holidayOperOpenHhmm'] as String?,
      holidayCloseOpenHhmm: json['holidayCloseOpenHhmm'] as String?,
      parkingchrgeInfo: json['parkingchrgeInfo'] as String?,
      basicTime: json['basicTime'] as String?,
      basicCharge: json['basicCharge'] as String?,
      addunitTime: json['addunitTime'] as String?,
      addunitCharge: json['addunitCharge'] as String?,
      metpay: json['metpay'] as String?,
    );

Map<String, dynamic> _$$_ResponseCoordinateModelToJson(
        _$_ResponseCoordinateModel instance) =>
    <String, dynamic>{
      'prkplceNo': instance.prkplceNo,
      'rdnmadr': instance.rdnmadr,
      'lnmadr': instance.lnmadr,
      'enforceSe': instance.enforceSe,
      'operDay': instance.operDay,
      'weekdayOperOpenHhmm': instance.weekdayOperOpenHhmm,
      'weekdayOperColseHhmm': instance.weekdayOperColseHhmm,
      'satOperOperOpenHhmm': instance.satOperOperOpenHhmm,
      'satOperCloseHhmm': instance.satOperCloseHhmm,
      'holidayOperOpenHhmm': instance.holidayOperOpenHhmm,
      'holidayCloseOpenHhmm': instance.holidayCloseOpenHhmm,
      'parkingchrgeInfo': instance.parkingchrgeInfo,
      'basicTime': instance.basicTime,
      'basicCharge': instance.basicCharge,
      'addunitTime': instance.addunitTime,
      'addunitCharge': instance.addunitCharge,
      'metpay': instance.metpay,
    };
