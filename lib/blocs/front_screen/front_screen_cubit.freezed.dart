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
      @required bool isDataDownloaded,
      @required bool firstFetch,
      @required Measurement measurement,
      @required bool lastMeasurementsLoading,
      @required List<Measurement> lastMeasurements,
      @required List<String> lastMeasurementsIDS,
      @required bool lastMeasurementsHadError,
      @required bool newMeasurementsHadError}) {
    return _Initial(
      title: title,
      chosenStatistic: chosenStatistic,
      chosenIndex: chosenIndex,
      isButtonClicked: isButtonClicked,
      isDataDownloaded: isDataDownloaded,
      firstFetch: firstFetch,
      measurement: measurement,
      lastMeasurementsLoading: lastMeasurementsLoading,
      lastMeasurements: lastMeasurements,
      lastMeasurementsIDS: lastMeasurementsIDS,
      lastMeasurementsHadError: lastMeasurementsHadError,
      newMeasurementsHadError: newMeasurementsHadError,
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
  bool get isDataDownloaded;
  bool get firstFetch;
  Measurement get measurement;
  bool get lastMeasurementsLoading;
  List<Measurement> get lastMeasurements;
  List<String> get lastMeasurementsIDS;
  bool get lastMeasurementsHadError;
  bool get newMeasurementsHadError;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            String title,
            List<bool> chosenStatistic,
            int chosenIndex,
            bool isButtonClicked,
            bool isDataDownloaded,
            bool firstFetch,
            Measurement measurement,
            bool lastMeasurementsLoading,
            List<Measurement> lastMeasurements,
            List<String> lastMeasurementsIDS,
            bool lastMeasurementsHadError,
            bool newMeasurementsHadError),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        String title,
        List<bool> chosenStatistic,
        int chosenIndex,
        bool isButtonClicked,
        bool isDataDownloaded,
        bool firstFetch,
        Measurement measurement,
        bool lastMeasurementsLoading,
        List<Measurement> lastMeasurements,
        List<String> lastMeasurementsIDS,
        bool lastMeasurementsHadError,
        bool newMeasurementsHadError),
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
      bool isDataDownloaded,
      bool firstFetch,
      Measurement measurement,
      bool lastMeasurementsLoading,
      List<Measurement> lastMeasurements,
      List<String> lastMeasurementsIDS,
      bool lastMeasurementsHadError,
      bool newMeasurementsHadError});
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
    Object isDataDownloaded = freezed,
    Object firstFetch = freezed,
    Object measurement = freezed,
    Object lastMeasurementsLoading = freezed,
    Object lastMeasurements = freezed,
    Object lastMeasurementsIDS = freezed,
    Object lastMeasurementsHadError = freezed,
    Object newMeasurementsHadError = freezed,
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
      isDataDownloaded: isDataDownloaded == freezed
          ? _value.isDataDownloaded
          : isDataDownloaded as bool,
      firstFetch:
          firstFetch == freezed ? _value.firstFetch : firstFetch as bool,
      measurement: measurement == freezed
          ? _value.measurement
          : measurement as Measurement,
      lastMeasurementsLoading: lastMeasurementsLoading == freezed
          ? _value.lastMeasurementsLoading
          : lastMeasurementsLoading as bool,
      lastMeasurements: lastMeasurements == freezed
          ? _value.lastMeasurements
          : lastMeasurements as List<Measurement>,
      lastMeasurementsIDS: lastMeasurementsIDS == freezed
          ? _value.lastMeasurementsIDS
          : lastMeasurementsIDS as List<String>,
      lastMeasurementsHadError: lastMeasurementsHadError == freezed
          ? _value.lastMeasurementsHadError
          : lastMeasurementsHadError as bool,
      newMeasurementsHadError: newMeasurementsHadError == freezed
          ? _value.newMeasurementsHadError
          : newMeasurementsHadError as bool,
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
      bool isDataDownloaded,
      bool firstFetch,
      Measurement measurement,
      bool lastMeasurementsLoading,
      List<Measurement> lastMeasurements,
      List<String> lastMeasurementsIDS,
      bool lastMeasurementsHadError,
      bool newMeasurementsHadError});
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
    Object isDataDownloaded = freezed,
    Object firstFetch = freezed,
    Object measurement = freezed,
    Object lastMeasurementsLoading = freezed,
    Object lastMeasurements = freezed,
    Object lastMeasurementsIDS = freezed,
    Object lastMeasurementsHadError = freezed,
    Object newMeasurementsHadError = freezed,
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
      isDataDownloaded: isDataDownloaded == freezed
          ? _value.isDataDownloaded
          : isDataDownloaded as bool,
      firstFetch:
          firstFetch == freezed ? _value.firstFetch : firstFetch as bool,
      measurement: measurement == freezed
          ? _value.measurement
          : measurement as Measurement,
      lastMeasurementsLoading: lastMeasurementsLoading == freezed
          ? _value.lastMeasurementsLoading
          : lastMeasurementsLoading as bool,
      lastMeasurements: lastMeasurements == freezed
          ? _value.lastMeasurements
          : lastMeasurements as List<Measurement>,
      lastMeasurementsIDS: lastMeasurementsIDS == freezed
          ? _value.lastMeasurementsIDS
          : lastMeasurementsIDS as List<String>,
      lastMeasurementsHadError: lastMeasurementsHadError == freezed
          ? _value.lastMeasurementsHadError
          : lastMeasurementsHadError as bool,
      newMeasurementsHadError: newMeasurementsHadError == freezed
          ? _value.newMeasurementsHadError
          : newMeasurementsHadError as bool,
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
      @required this.isDataDownloaded,
      @required this.firstFetch,
      @required this.measurement,
      @required this.lastMeasurementsLoading,
      @required this.lastMeasurements,
      @required this.lastMeasurementsIDS,
      @required this.lastMeasurementsHadError,
      @required this.newMeasurementsHadError})
      : assert(title != null),
        assert(chosenStatistic != null),
        assert(chosenIndex != null),
        assert(isButtonClicked != null),
        assert(isDataDownloaded != null),
        assert(firstFetch != null),
        assert(measurement != null),
        assert(lastMeasurementsLoading != null),
        assert(lastMeasurements != null),
        assert(lastMeasurementsIDS != null),
        assert(lastMeasurementsHadError != null),
        assert(newMeasurementsHadError != null);

  @override
  final String title;
  @override
  final List<bool> chosenStatistic;
  @override
  final int chosenIndex;
  @override
  final bool isButtonClicked;
  @override
  final bool isDataDownloaded;
  @override
  final bool firstFetch;
  @override
  final Measurement measurement;
  @override
  final bool lastMeasurementsLoading;
  @override
  final List<Measurement> lastMeasurements;
  @override
  final List<String> lastMeasurementsIDS;
  @override
  final bool lastMeasurementsHadError;
  @override
  final bool newMeasurementsHadError;

  @override
  String toString() {
    return 'FrontScreenState.initial(title: $title, chosenStatistic: $chosenStatistic, chosenIndex: $chosenIndex, isButtonClicked: $isButtonClicked, isDataDownloaded: $isDataDownloaded, firstFetch: $firstFetch, measurement: $measurement, lastMeasurementsLoading: $lastMeasurementsLoading, lastMeasurements: $lastMeasurements, lastMeasurementsIDS: $lastMeasurementsIDS, lastMeasurementsHadError: $lastMeasurementsHadError, newMeasurementsHadError: $newMeasurementsHadError)';
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
            (identical(other.isDataDownloaded, isDataDownloaded) ||
                const DeepCollectionEquality()
                    .equals(other.isDataDownloaded, isDataDownloaded)) &&
            (identical(other.firstFetch, firstFetch) ||
                const DeepCollectionEquality()
                    .equals(other.firstFetch, firstFetch)) &&
            (identical(other.measurement, measurement) ||
                const DeepCollectionEquality()
                    .equals(other.measurement, measurement)) &&
            (identical(
                    other.lastMeasurementsLoading, lastMeasurementsLoading) ||
                const DeepCollectionEquality().equals(
                    other.lastMeasurementsLoading, lastMeasurementsLoading)) &&
            (identical(other.lastMeasurements, lastMeasurements) ||
                const DeepCollectionEquality()
                    .equals(other.lastMeasurements, lastMeasurements)) &&
            (identical(other.lastMeasurementsIDS, lastMeasurementsIDS) ||
                const DeepCollectionEquality()
                    .equals(other.lastMeasurementsIDS, lastMeasurementsIDS)) &&
            (identical(
                    other.lastMeasurementsHadError, lastMeasurementsHadError) ||
                const DeepCollectionEquality().equals(
                    other.lastMeasurementsHadError,
                    lastMeasurementsHadError)) &&
            (identical(
                    other.newMeasurementsHadError, newMeasurementsHadError) ||
                const DeepCollectionEquality().equals(
                    other.newMeasurementsHadError, newMeasurementsHadError)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(chosenStatistic) ^
      const DeepCollectionEquality().hash(chosenIndex) ^
      const DeepCollectionEquality().hash(isButtonClicked) ^
      const DeepCollectionEquality().hash(isDataDownloaded) ^
      const DeepCollectionEquality().hash(firstFetch) ^
      const DeepCollectionEquality().hash(measurement) ^
      const DeepCollectionEquality().hash(lastMeasurementsLoading) ^
      const DeepCollectionEquality().hash(lastMeasurements) ^
      const DeepCollectionEquality().hash(lastMeasurementsIDS) ^
      const DeepCollectionEquality().hash(lastMeasurementsHadError) ^
      const DeepCollectionEquality().hash(newMeasurementsHadError);

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
            bool isDataDownloaded,
            bool firstFetch,
            Measurement measurement,
            bool lastMeasurementsLoading,
            List<Measurement> lastMeasurements,
            List<String> lastMeasurementsIDS,
            bool lastMeasurementsHadError,
            bool newMeasurementsHadError),
  }) {
    assert(initial != null);
    return initial(
        title,
        chosenStatistic,
        chosenIndex,
        isButtonClicked,
        isDataDownloaded,
        firstFetch,
        measurement,
        lastMeasurementsLoading,
        lastMeasurements,
        lastMeasurementsIDS,
        lastMeasurementsHadError,
        newMeasurementsHadError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        String title,
        List<bool> chosenStatistic,
        int chosenIndex,
        bool isButtonClicked,
        bool isDataDownloaded,
        bool firstFetch,
        Measurement measurement,
        bool lastMeasurementsLoading,
        List<Measurement> lastMeasurements,
        List<String> lastMeasurementsIDS,
        bool lastMeasurementsHadError,
        bool newMeasurementsHadError),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(
          title,
          chosenStatistic,
          chosenIndex,
          isButtonClicked,
          isDataDownloaded,
          firstFetch,
          measurement,
          lastMeasurementsLoading,
          lastMeasurements,
          lastMeasurementsIDS,
          lastMeasurementsHadError,
          newMeasurementsHadError);
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
      @required bool isDataDownloaded,
      @required bool firstFetch,
      @required Measurement measurement,
      @required bool lastMeasurementsLoading,
      @required List<Measurement> lastMeasurements,
      @required List<String> lastMeasurementsIDS,
      @required bool lastMeasurementsHadError,
      @required bool newMeasurementsHadError}) = _$_Initial;

  @override
  String get title;
  @override
  List<bool> get chosenStatistic;
  @override
  int get chosenIndex;
  @override
  bool get isButtonClicked;
  @override
  bool get isDataDownloaded;
  @override
  bool get firstFetch;
  @override
  Measurement get measurement;
  @override
  bool get lastMeasurementsLoading;
  @override
  List<Measurement> get lastMeasurements;
  @override
  List<String> get lastMeasurementsIDS;
  @override
  bool get lastMeasurementsHadError;
  @override
  bool get newMeasurementsHadError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith;
}
