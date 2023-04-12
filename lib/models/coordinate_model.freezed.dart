// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestCoordinateModel _$RequestCoordinateModelFromJson(
    Map<String, dynamic> json) {
  return _RequestCoordinateModel.fromJson(json);
}

/// @nodoc
mixin _$RequestCoordinateModel {
  List<double> get latitude_bound => throw _privateConstructorUsedError;
  List<double> get longitude_bound => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestCoordinateModelCopyWith<RequestCoordinateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCoordinateModelCopyWith<$Res> {
  factory $RequestCoordinateModelCopyWith(RequestCoordinateModel value,
          $Res Function(RequestCoordinateModel) then) =
      _$RequestCoordinateModelCopyWithImpl<$Res, RequestCoordinateModel>;
  @useResult
  $Res call({List<double> latitude_bound, List<double> longitude_bound});
}

/// @nodoc
class _$RequestCoordinateModelCopyWithImpl<$Res,
        $Val extends RequestCoordinateModel>
    implements $RequestCoordinateModelCopyWith<$Res> {
  _$RequestCoordinateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude_bound = null,
    Object? longitude_bound = null,
  }) {
    return _then(_value.copyWith(
      latitude_bound: null == latitude_bound
          ? _value.latitude_bound
          : latitude_bound // ignore: cast_nullable_to_non_nullable
              as List<double>,
      longitude_bound: null == longitude_bound
          ? _value.longitude_bound
          : longitude_bound // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestCoordinateModelCopyWith<$Res>
    implements $RequestCoordinateModelCopyWith<$Res> {
  factory _$$_RequestCoordinateModelCopyWith(_$_RequestCoordinateModel value,
          $Res Function(_$_RequestCoordinateModel) then) =
      __$$_RequestCoordinateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double> latitude_bound, List<double> longitude_bound});
}

/// @nodoc
class __$$_RequestCoordinateModelCopyWithImpl<$Res>
    extends _$RequestCoordinateModelCopyWithImpl<$Res,
        _$_RequestCoordinateModel>
    implements _$$_RequestCoordinateModelCopyWith<$Res> {
  __$$_RequestCoordinateModelCopyWithImpl(_$_RequestCoordinateModel _value,
      $Res Function(_$_RequestCoordinateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude_bound = null,
    Object? longitude_bound = null,
  }) {
    return _then(_$_RequestCoordinateModel(
      latitude_bound: null == latitude_bound
          ? _value._latitude_bound
          : latitude_bound // ignore: cast_nullable_to_non_nullable
              as List<double>,
      longitude_bound: null == longitude_bound
          ? _value._longitude_bound
          : longitude_bound // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequestCoordinateModel
    with DiagnosticableTreeMixin
    implements _RequestCoordinateModel {
  const _$_RequestCoordinateModel(
      {required final List<double> latitude_bound,
      required final List<double> longitude_bound})
      : _latitude_bound = latitude_bound,
        _longitude_bound = longitude_bound;

  factory _$_RequestCoordinateModel.fromJson(Map<String, dynamic> json) =>
      _$$_RequestCoordinateModelFromJson(json);

  final List<double> _latitude_bound;
  @override
  List<double> get latitude_bound {
    if (_latitude_bound is EqualUnmodifiableListView) return _latitude_bound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latitude_bound);
  }

  final List<double> _longitude_bound;
  @override
  List<double> get longitude_bound {
    if (_longitude_bound is EqualUnmodifiableListView) return _longitude_bound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_longitude_bound);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestCoordinateModel(latitude_bound: $latitude_bound, longitude_bound: $longitude_bound)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestCoordinateModel'))
      ..add(DiagnosticsProperty('latitude_bound', latitude_bound))
      ..add(DiagnosticsProperty('longitude_bound', longitude_bound));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestCoordinateModel &&
            const DeepCollectionEquality()
                .equals(other._latitude_bound, _latitude_bound) &&
            const DeepCollectionEquality()
                .equals(other._longitude_bound, _longitude_bound));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_latitude_bound),
      const DeepCollectionEquality().hash(_longitude_bound));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestCoordinateModelCopyWith<_$_RequestCoordinateModel> get copyWith =>
      __$$_RequestCoordinateModelCopyWithImpl<_$_RequestCoordinateModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestCoordinateModelToJson(
      this,
    );
  }
}

abstract class _RequestCoordinateModel implements RequestCoordinateModel {
  const factory _RequestCoordinateModel(
      {required final List<double> latitude_bound,
      required final List<double> longitude_bound}) = _$_RequestCoordinateModel;

  factory _RequestCoordinateModel.fromJson(Map<String, dynamic> json) =
      _$_RequestCoordinateModel.fromJson;

  @override
  List<double> get latitude_bound;
  @override
  List<double> get longitude_bound;
  @override
  @JsonKey(ignore: true)
  _$$_RequestCoordinateModelCopyWith<_$_RequestCoordinateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseCoordinateModel _$ResponseCoordinateModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseCoordinateModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseCoordinateModel {
  String get prkplceNo => throw _privateConstructorUsedError;
  String? get rdnmadr => throw _privateConstructorUsedError;
  String? get lnmadr => throw _privateConstructorUsedError;
  String? get enforceSe => throw _privateConstructorUsedError;
  String? get operDay => throw _privateConstructorUsedError;
  String? get weekdayOperOpenHhmm => throw _privateConstructorUsedError;
  String? get weekdayOperColseHhmm => throw _privateConstructorUsedError;
  String? get satOperOperOpenHhmm => throw _privateConstructorUsedError;
  String? get satOperCloseHhmm => throw _privateConstructorUsedError;
  String? get holidayOperOpenHhmm => throw _privateConstructorUsedError;
  String? get holidayCloseOpenHhmm => throw _privateConstructorUsedError;
  String? get parkingchrgeInfo => throw _privateConstructorUsedError;
  String? get basicTime => throw _privateConstructorUsedError;
  String? get basicCharge => throw _privateConstructorUsedError;
  String? get addunitTime => throw _privateConstructorUsedError;
  String? get addunitCharge => throw _privateConstructorUsedError;
  String? get metpay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseCoordinateModelCopyWith<ResponseCoordinateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCoordinateModelCopyWith<$Res> {
  factory $ResponseCoordinateModelCopyWith(ResponseCoordinateModel value,
          $Res Function(ResponseCoordinateModel) then) =
      _$ResponseCoordinateModelCopyWithImpl<$Res, ResponseCoordinateModel>;
  @useResult
  $Res call(
      {String prkplceNo,
      String? rdnmadr,
      String? lnmadr,
      String? enforceSe,
      String? operDay,
      String? weekdayOperOpenHhmm,
      String? weekdayOperColseHhmm,
      String? satOperOperOpenHhmm,
      String? satOperCloseHhmm,
      String? holidayOperOpenHhmm,
      String? holidayCloseOpenHhmm,
      String? parkingchrgeInfo,
      String? basicTime,
      String? basicCharge,
      String? addunitTime,
      String? addunitCharge,
      String? metpay});
}

/// @nodoc
class _$ResponseCoordinateModelCopyWithImpl<$Res,
        $Val extends ResponseCoordinateModel>
    implements $ResponseCoordinateModelCopyWith<$Res> {
  _$ResponseCoordinateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prkplceNo = null,
    Object? rdnmadr = freezed,
    Object? lnmadr = freezed,
    Object? enforceSe = freezed,
    Object? operDay = freezed,
    Object? weekdayOperOpenHhmm = freezed,
    Object? weekdayOperColseHhmm = freezed,
    Object? satOperOperOpenHhmm = freezed,
    Object? satOperCloseHhmm = freezed,
    Object? holidayOperOpenHhmm = freezed,
    Object? holidayCloseOpenHhmm = freezed,
    Object? parkingchrgeInfo = freezed,
    Object? basicTime = freezed,
    Object? basicCharge = freezed,
    Object? addunitTime = freezed,
    Object? addunitCharge = freezed,
    Object? metpay = freezed,
  }) {
    return _then(_value.copyWith(
      prkplceNo: null == prkplceNo
          ? _value.prkplceNo
          : prkplceNo // ignore: cast_nullable_to_non_nullable
              as String,
      rdnmadr: freezed == rdnmadr
          ? _value.rdnmadr
          : rdnmadr // ignore: cast_nullable_to_non_nullable
              as String?,
      lnmadr: freezed == lnmadr
          ? _value.lnmadr
          : lnmadr // ignore: cast_nullable_to_non_nullable
              as String?,
      enforceSe: freezed == enforceSe
          ? _value.enforceSe
          : enforceSe // ignore: cast_nullable_to_non_nullable
              as String?,
      operDay: freezed == operDay
          ? _value.operDay
          : operDay // ignore: cast_nullable_to_non_nullable
              as String?,
      weekdayOperOpenHhmm: freezed == weekdayOperOpenHhmm
          ? _value.weekdayOperOpenHhmm
          : weekdayOperOpenHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      weekdayOperColseHhmm: freezed == weekdayOperColseHhmm
          ? _value.weekdayOperColseHhmm
          : weekdayOperColseHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      satOperOperOpenHhmm: freezed == satOperOperOpenHhmm
          ? _value.satOperOperOpenHhmm
          : satOperOperOpenHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      satOperCloseHhmm: freezed == satOperCloseHhmm
          ? _value.satOperCloseHhmm
          : satOperCloseHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      holidayOperOpenHhmm: freezed == holidayOperOpenHhmm
          ? _value.holidayOperOpenHhmm
          : holidayOperOpenHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      holidayCloseOpenHhmm: freezed == holidayCloseOpenHhmm
          ? _value.holidayCloseOpenHhmm
          : holidayCloseOpenHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      parkingchrgeInfo: freezed == parkingchrgeInfo
          ? _value.parkingchrgeInfo
          : parkingchrgeInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      basicTime: freezed == basicTime
          ? _value.basicTime
          : basicTime // ignore: cast_nullable_to_non_nullable
              as String?,
      basicCharge: freezed == basicCharge
          ? _value.basicCharge
          : basicCharge // ignore: cast_nullable_to_non_nullable
              as String?,
      addunitTime: freezed == addunitTime
          ? _value.addunitTime
          : addunitTime // ignore: cast_nullable_to_non_nullable
              as String?,
      addunitCharge: freezed == addunitCharge
          ? _value.addunitCharge
          : addunitCharge // ignore: cast_nullable_to_non_nullable
              as String?,
      metpay: freezed == metpay
          ? _value.metpay
          : metpay // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseCoordinateModelCopyWith<$Res>
    implements $ResponseCoordinateModelCopyWith<$Res> {
  factory _$$_ResponseCoordinateModelCopyWith(_$_ResponseCoordinateModel value,
          $Res Function(_$_ResponseCoordinateModel) then) =
      __$$_ResponseCoordinateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String prkplceNo,
      String? rdnmadr,
      String? lnmadr,
      String? enforceSe,
      String? operDay,
      String? weekdayOperOpenHhmm,
      String? weekdayOperColseHhmm,
      String? satOperOperOpenHhmm,
      String? satOperCloseHhmm,
      String? holidayOperOpenHhmm,
      String? holidayCloseOpenHhmm,
      String? parkingchrgeInfo,
      String? basicTime,
      String? basicCharge,
      String? addunitTime,
      String? addunitCharge,
      String? metpay});
}

/// @nodoc
class __$$_ResponseCoordinateModelCopyWithImpl<$Res>
    extends _$ResponseCoordinateModelCopyWithImpl<$Res,
        _$_ResponseCoordinateModel>
    implements _$$_ResponseCoordinateModelCopyWith<$Res> {
  __$$_ResponseCoordinateModelCopyWithImpl(_$_ResponseCoordinateModel _value,
      $Res Function(_$_ResponseCoordinateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prkplceNo = null,
    Object? rdnmadr = freezed,
    Object? lnmadr = freezed,
    Object? enforceSe = freezed,
    Object? operDay = freezed,
    Object? weekdayOperOpenHhmm = freezed,
    Object? weekdayOperColseHhmm = freezed,
    Object? satOperOperOpenHhmm = freezed,
    Object? satOperCloseHhmm = freezed,
    Object? holidayOperOpenHhmm = freezed,
    Object? holidayCloseOpenHhmm = freezed,
    Object? parkingchrgeInfo = freezed,
    Object? basicTime = freezed,
    Object? basicCharge = freezed,
    Object? addunitTime = freezed,
    Object? addunitCharge = freezed,
    Object? metpay = freezed,
  }) {
    return _then(_$_ResponseCoordinateModel(
      prkplceNo: null == prkplceNo
          ? _value.prkplceNo
          : prkplceNo // ignore: cast_nullable_to_non_nullable
              as String,
      rdnmadr: freezed == rdnmadr
          ? _value.rdnmadr
          : rdnmadr // ignore: cast_nullable_to_non_nullable
              as String?,
      lnmadr: freezed == lnmadr
          ? _value.lnmadr
          : lnmadr // ignore: cast_nullable_to_non_nullable
              as String?,
      enforceSe: freezed == enforceSe
          ? _value.enforceSe
          : enforceSe // ignore: cast_nullable_to_non_nullable
              as String?,
      operDay: freezed == operDay
          ? _value.operDay
          : operDay // ignore: cast_nullable_to_non_nullable
              as String?,
      weekdayOperOpenHhmm: freezed == weekdayOperOpenHhmm
          ? _value.weekdayOperOpenHhmm
          : weekdayOperOpenHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      weekdayOperColseHhmm: freezed == weekdayOperColseHhmm
          ? _value.weekdayOperColseHhmm
          : weekdayOperColseHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      satOperOperOpenHhmm: freezed == satOperOperOpenHhmm
          ? _value.satOperOperOpenHhmm
          : satOperOperOpenHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      satOperCloseHhmm: freezed == satOperCloseHhmm
          ? _value.satOperCloseHhmm
          : satOperCloseHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      holidayOperOpenHhmm: freezed == holidayOperOpenHhmm
          ? _value.holidayOperOpenHhmm
          : holidayOperOpenHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      holidayCloseOpenHhmm: freezed == holidayCloseOpenHhmm
          ? _value.holidayCloseOpenHhmm
          : holidayCloseOpenHhmm // ignore: cast_nullable_to_non_nullable
              as String?,
      parkingchrgeInfo: freezed == parkingchrgeInfo
          ? _value.parkingchrgeInfo
          : parkingchrgeInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      basicTime: freezed == basicTime
          ? _value.basicTime
          : basicTime // ignore: cast_nullable_to_non_nullable
              as String?,
      basicCharge: freezed == basicCharge
          ? _value.basicCharge
          : basicCharge // ignore: cast_nullable_to_non_nullable
              as String?,
      addunitTime: freezed == addunitTime
          ? _value.addunitTime
          : addunitTime // ignore: cast_nullable_to_non_nullable
              as String?,
      addunitCharge: freezed == addunitCharge
          ? _value.addunitCharge
          : addunitCharge // ignore: cast_nullable_to_non_nullable
              as String?,
      metpay: freezed == metpay
          ? _value.metpay
          : metpay // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseCoordinateModel
    with DiagnosticableTreeMixin
    implements _ResponseCoordinateModel {
  const _$_ResponseCoordinateModel(
      {required this.prkplceNo,
      required this.rdnmadr,
      required this.lnmadr,
      required this.enforceSe,
      required this.operDay,
      required this.weekdayOperOpenHhmm,
      required this.weekdayOperColseHhmm,
      required this.satOperOperOpenHhmm,
      required this.satOperCloseHhmm,
      required this.holidayOperOpenHhmm,
      required this.holidayCloseOpenHhmm,
      required this.parkingchrgeInfo,
      required this.basicTime,
      required this.basicCharge,
      required this.addunitTime,
      required this.addunitCharge,
      required this.metpay});

  factory _$_ResponseCoordinateModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseCoordinateModelFromJson(json);

  @override
  final String prkplceNo;
  @override
  final String? rdnmadr;
  @override
  final String? lnmadr;
  @override
  final String? enforceSe;
  @override
  final String? operDay;
  @override
  final String? weekdayOperOpenHhmm;
  @override
  final String? weekdayOperColseHhmm;
  @override
  final String? satOperOperOpenHhmm;
  @override
  final String? satOperCloseHhmm;
  @override
  final String? holidayOperOpenHhmm;
  @override
  final String? holidayCloseOpenHhmm;
  @override
  final String? parkingchrgeInfo;
  @override
  final String? basicTime;
  @override
  final String? basicCharge;
  @override
  final String? addunitTime;
  @override
  final String? addunitCharge;
  @override
  final String? metpay;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseCoordinateModel(prkplceNo: $prkplceNo, rdnmadr: $rdnmadr, lnmadr: $lnmadr, enforceSe: $enforceSe, operDay: $operDay, weekdayOperOpenHhmm: $weekdayOperOpenHhmm, weekdayOperColseHhmm: $weekdayOperColseHhmm, satOperOperOpenHhmm: $satOperOperOpenHhmm, satOperCloseHhmm: $satOperCloseHhmm, holidayOperOpenHhmm: $holidayOperOpenHhmm, holidayCloseOpenHhmm: $holidayCloseOpenHhmm, parkingchrgeInfo: $parkingchrgeInfo, basicTime: $basicTime, basicCharge: $basicCharge, addunitTime: $addunitTime, addunitCharge: $addunitCharge, metpay: $metpay)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResponseCoordinateModel'))
      ..add(DiagnosticsProperty('prkplceNo', prkplceNo))
      ..add(DiagnosticsProperty('rdnmadr', rdnmadr))
      ..add(DiagnosticsProperty('lnmadr', lnmadr))
      ..add(DiagnosticsProperty('enforceSe', enforceSe))
      ..add(DiagnosticsProperty('operDay', operDay))
      ..add(DiagnosticsProperty('weekdayOperOpenHhmm', weekdayOperOpenHhmm))
      ..add(DiagnosticsProperty('weekdayOperColseHhmm', weekdayOperColseHhmm))
      ..add(DiagnosticsProperty('satOperOperOpenHhmm', satOperOperOpenHhmm))
      ..add(DiagnosticsProperty('satOperCloseHhmm', satOperCloseHhmm))
      ..add(DiagnosticsProperty('holidayOperOpenHhmm', holidayOperOpenHhmm))
      ..add(DiagnosticsProperty('holidayCloseOpenHhmm', holidayCloseOpenHhmm))
      ..add(DiagnosticsProperty('parkingchrgeInfo', parkingchrgeInfo))
      ..add(DiagnosticsProperty('basicTime', basicTime))
      ..add(DiagnosticsProperty('basicCharge', basicCharge))
      ..add(DiagnosticsProperty('addunitTime', addunitTime))
      ..add(DiagnosticsProperty('addunitCharge', addunitCharge))
      ..add(DiagnosticsProperty('metpay', metpay));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseCoordinateModel &&
            (identical(other.prkplceNo, prkplceNo) ||
                other.prkplceNo == prkplceNo) &&
            (identical(other.rdnmadr, rdnmadr) || other.rdnmadr == rdnmadr) &&
            (identical(other.lnmadr, lnmadr) || other.lnmadr == lnmadr) &&
            (identical(other.enforceSe, enforceSe) ||
                other.enforceSe == enforceSe) &&
            (identical(other.operDay, operDay) || other.operDay == operDay) &&
            (identical(other.weekdayOperOpenHhmm, weekdayOperOpenHhmm) ||
                other.weekdayOperOpenHhmm == weekdayOperOpenHhmm) &&
            (identical(other.weekdayOperColseHhmm, weekdayOperColseHhmm) ||
                other.weekdayOperColseHhmm == weekdayOperColseHhmm) &&
            (identical(other.satOperOperOpenHhmm, satOperOperOpenHhmm) ||
                other.satOperOperOpenHhmm == satOperOperOpenHhmm) &&
            (identical(other.satOperCloseHhmm, satOperCloseHhmm) ||
                other.satOperCloseHhmm == satOperCloseHhmm) &&
            (identical(other.holidayOperOpenHhmm, holidayOperOpenHhmm) ||
                other.holidayOperOpenHhmm == holidayOperOpenHhmm) &&
            (identical(other.holidayCloseOpenHhmm, holidayCloseOpenHhmm) ||
                other.holidayCloseOpenHhmm == holidayCloseOpenHhmm) &&
            (identical(other.parkingchrgeInfo, parkingchrgeInfo) ||
                other.parkingchrgeInfo == parkingchrgeInfo) &&
            (identical(other.basicTime, basicTime) ||
                other.basicTime == basicTime) &&
            (identical(other.basicCharge, basicCharge) ||
                other.basicCharge == basicCharge) &&
            (identical(other.addunitTime, addunitTime) ||
                other.addunitTime == addunitTime) &&
            (identical(other.addunitCharge, addunitCharge) ||
                other.addunitCharge == addunitCharge) &&
            (identical(other.metpay, metpay) || other.metpay == metpay));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      prkplceNo,
      rdnmadr,
      lnmadr,
      enforceSe,
      operDay,
      weekdayOperOpenHhmm,
      weekdayOperColseHhmm,
      satOperOperOpenHhmm,
      satOperCloseHhmm,
      holidayOperOpenHhmm,
      holidayCloseOpenHhmm,
      parkingchrgeInfo,
      basicTime,
      basicCharge,
      addunitTime,
      addunitCharge,
      metpay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseCoordinateModelCopyWith<_$_ResponseCoordinateModel>
      get copyWith =>
          __$$_ResponseCoordinateModelCopyWithImpl<_$_ResponseCoordinateModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseCoordinateModelToJson(
      this,
    );
  }
}

abstract class _ResponseCoordinateModel implements ResponseCoordinateModel {
  const factory _ResponseCoordinateModel(
      {required final String prkplceNo,
      required final String? rdnmadr,
      required final String? lnmadr,
      required final String? enforceSe,
      required final String? operDay,
      required final String? weekdayOperOpenHhmm,
      required final String? weekdayOperColseHhmm,
      required final String? satOperOperOpenHhmm,
      required final String? satOperCloseHhmm,
      required final String? holidayOperOpenHhmm,
      required final String? holidayCloseOpenHhmm,
      required final String? parkingchrgeInfo,
      required final String? basicTime,
      required final String? basicCharge,
      required final String? addunitTime,
      required final String? addunitCharge,
      required final String? metpay}) = _$_ResponseCoordinateModel;

  factory _ResponseCoordinateModel.fromJson(Map<String, dynamic> json) =
      _$_ResponseCoordinateModel.fromJson;

  @override
  String get prkplceNo;
  @override
  String? get rdnmadr;
  @override
  String? get lnmadr;
  @override
  String? get enforceSe;
  @override
  String? get operDay;
  @override
  String? get weekdayOperOpenHhmm;
  @override
  String? get weekdayOperColseHhmm;
  @override
  String? get satOperOperOpenHhmm;
  @override
  String? get satOperCloseHhmm;
  @override
  String? get holidayOperOpenHhmm;
  @override
  String? get holidayCloseOpenHhmm;
  @override
  String? get parkingchrgeInfo;
  @override
  String? get basicTime;
  @override
  String? get basicCharge;
  @override
  String? get addunitTime;
  @override
  String? get addunitCharge;
  @override
  String? get metpay;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseCoordinateModelCopyWith<_$_ResponseCoordinateModel>
      get copyWith => throw _privateConstructorUsedError;
}
