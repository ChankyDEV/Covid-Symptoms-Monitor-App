// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'front_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FrontScreenStateTearOff {
  const _$FrontScreenStateTearOff();

// ignore: unused_element
  _Initial initial(
      {@required String title,
      @required List<bool> chosenStatistic,
      @required int chosenIndex,
      @required bool isButtonClicked,
      @required bool isDataReady,
      @required Measurement measurement}) {
    return _Initial(
      title: title,
      chosenStatistic: chosenStatistic,
      chosenIndex: chosenIndex,
      isButtonClicked: isButtonClicked,
      isDataReady: isDataReady,
      measurement: measurement,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FrontScreenState = _$FrontScreenStateTearOff();

/// @nodoc
mixin _$FrontScreenState {
  String get title;
  List<bool> get chosenStatistic;
  int get chosenIndex;
  bool get isButtonClicked;
  bool get isDataReady;
  Measurement get measurement;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            String title,
            List<bool> chosenStatistic,
            int chosenIndex,
            bool isButtonClicked,
            bool isDataReady,
            Measurement measurement),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(String title, List<bool> chosenStatistic, int chosenIndex,
        bool isButtonClicked, bool isDataReady, Measurement measurement),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $FrontScreenStateCopyWith<FrontScreenState> get copyWith;
}

/// @nodoc
abstract class $FrontScreenStateCopyWith<$Res> {
  factory $FrontScreenStateCopyWith(
          FrontScreenState value, $Res Function(FrontScreenState) then) =
      _$FrontScreenStateCopyWithImpl<$Res>;
  $Res call(
      {String title,
      List<bool> chosenStatistic,
      int chosenIndex,
      bool isButtonClicked,
      bool isDataReady,
      Measurement measurement});
}

/// @nodoc
class _$FrontScreenStateCopyWithImpl<$Res>
    implements $FrontScreenStateCopyWith<$Res> {
  _$FrontScreenStateCopyWithImpl(this._value, this._then);

  final FrontScreenState _value;
  // ignore: unused_field
  final $Res Function(FrontScreenState) _then;

  @override
  $Res call({
    Object title = freezed,
    Object chosenStatistic = freezed,
    Object chosenIndex = freezed,
    Object isButtonClicked = freezed,
    Object isDataReady = freezed,
    Object measurement = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      chosenStatistic: chosenStatistic == freezed
          ? _value.chosenStatistic
          : chosenStatistic as List<bool>,
      chosenIndex:
          chosenIndex == freezed ? _value.chosenIndex : chosenIndex as int,
      isButtonClicked: isButtonClicked == freezed
          ? _value.isButtonClicked
          : isButtonClicked as bool,
      isDataReady:
          isDataReady == freezed ? _value.isDataReady : isDataReady as bool,
      measurement: measurement == freezed
          ? _value.measurement
          : measurement as Measurement,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $FrontScreenStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      List<bool> chosenStatistic,
      int chosenIndex,
      bool isButtonClicked,
      bool isDataReady,
      Measurement measurement});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$FrontScreenStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object title = freezed,
    Object chosenStatistic = freezed,
    Object chosenIndex = freezed,
    Object isButtonClicked = freezed,
    Object isDataReady = freezed,
    Object measurement = freezed,
  }) {
    return _then(_Initial(
      title: title == freezed ? _value.title : title as String,
      chosenStatistic: chosenStatistic == freezed
          ? _value.chosenStatistic
          : chosenStatistic as List<bool>,
      chosenIndex:
          chosenIndex == freezed ? _value.chosenIndex : chosenIndex as int,
      isButtonClicked: isButtonClicked == freezed
          ? _value.isButtonClicked
          : isButtonClicked as bool,
      isDataReady:
          isDataReady == freezed ? _value.isDataReady : isDataReady as bool,
      measurement: measurement == freezed
          ? _value.measurement
          : measurement as Measurement,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial(
      {@required this.title,
      @required this.chosenStatistic,
      @required this.chosenIndex,
      @required this.isButtonClicked,
      @required this.isDataReady,
      @required this.measurement})
      : assert(title != null),
        assert(chosenStatistic != null),
        assert(chosenIndex != null),
        assert(isButtonClicked != null),
        assert(isDataReady != null),
        assert(measurement != null);

  @override
  final String title;
  @override
  final List<bool> chosenStatistic;
  @override
  final int chosenIndex;
  @override
  final bool isButtonClicked;
  @override
  final bool isDataReady;
  @override
  final Measurement measurement;

  @override
  String toString() {
    return 'FrontScreenState.initial(title: $title, chosenStatistic: $chosenStatistic, chosenIndex: $chosenIndex, isButtonClicked: $isButtonClicked, isDataReady: $isDataReady, measurement: $measurement)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.chosenStatistic, chosenStatistic) ||
                const DeepCollectionEquality()
                    .equals(other.chosenStatistic, chosenStatistic)) &&
            (identical(other.chosenIndex, chosenIndex) ||
                const DeepCollectionEquality()
                    .equals(other.chosenIndex, chosenIndex)) &&
            (identical(other.isButtonClicked, isButtonClicked) ||
                const DeepCollectionEquality()
                    .equals(other.isButtonClicked, isButtonClicked)) &&
            (identical(other.isDataReady, isDataReady) ||
                const DeepCollectionEquality()
                    .equals(other.isDataReady, isDataReady)) &&
            (identical(other.measurement, measurement) ||
                const DeepCollectionEquality()
                    .equals(other.measurement, measurement)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(chosenStatistic) ^
      const DeepCollectionEquality().hash(chosenIndex) ^
      const DeepCollectionEquality().hash(isButtonClicked) ^
      const DeepCollectionEquality().hash(isDataReady) ^
      const DeepCollectionEquality().hash(measurement);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            String title,
            List<bool> chosenStatistic,
            int chosenIndex,
            bool isButtonClicked,
            bool isDataReady,
            Measurement measurement),
  }) {
    assert(initial != null);
    return initial(title, chosenStatistic, chosenIndex, isButtonClicked,
        isDataReady, measurement);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(String title, List<bool> chosenStatistic, int chosenIndex,
        bool isButtonClicked, bool isDataReady, Measurement measurement),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(title, chosenStatistic, chosenIndex, isButtonClicked,
          isDataReady, measurement);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
  }) {
    assert(initial != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FrontScreenState {
  const factory _Initial(
      {@required String title,
      @required List<bool> chosenStatistic,
      @required int chosenIndex,
      @required bool isButtonClicked,
      @required bool isDataReady,
      @required Measurement measurement}) = _$_Initial;

  @override
  String get title;
  @override
  List<bool> get chosenStatistic;
  @override
  int get chosenIndex;
  @override
  bool get isButtonClicked;
  @override
  bool get isDataReady;
  @override
  Measurement get measurement;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith;
}
