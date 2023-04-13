import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'coordinate_model.freezed.dart';
part 'coordinate_model.g.dart';

@freezed
class CoordinateModel with _$CoordinateModel {
  /// 좌표 Bound 범위 내 데이터 결과 </br>
  /// prkplceNo : 주차장관리번호 </br>
  /// rdnmadr : 소재지도로명주소 </br>
  /// lnmadr : 소재지지번주소 </br>
  /// enforceSe : 부제시행구분 </br>
  /// operDay : 운영요일 </br>
  /// weekdayOperOpenHhmm : 퍙일운영시작시각 </br>
  /// weekdayOperColseHhmm : 평일운영종료시각 </br>
  /// satOperOperOpenHhmm : 토요일운영시작시각 </br>
  /// satOperCloseHhmm : 토요일운영종료시각 </br>
  /// holidayOperOpenHhmm : 공휴일운영시작시각 </br>
  /// holidayCloseOpenHhmm : 공휴일운영종료시각 </br>
  /// parkingchrgeInfo : 요금정보 </br>
  /// basicTime : 주차기본시간 </br>
  /// basicCharge : 주차기본요금 </br>
  /// addunitTime : 주차단위시간 </br>
  /// addunitCharge : 주차단위요금 </br>
  /// metpay : 결제방법
  const factory CoordinateModel({
    required String prkplceNo,
    required String? rdnmadr,
    required String? lnmadr,
    required String? enforceSe,
    required String? operDay,
    required String? weekdayOperOpenHhmm,
    required String? weekdayOperColseHhmm,
    required String? satOperOperOpenHhmm,
    required String? satOperCloseHhmm,
    required String? holidayOperOpenHhmm,
    required String? holidayCloseOpenHhmm,
    required String? parkingchrgeInfo,
    required String? basicTime,
    required String? basicCharge,
    required String? addunitTime,
    required String? addunitCharge,
    required String? metpay,
    required String? latitude,
    required String? longitude,
  }) = _CoordinateModel;

  factory CoordinateModel.fromJson(Map<String, Object?> json) =>
      _$CoordinateModelFromJson(json);
}
