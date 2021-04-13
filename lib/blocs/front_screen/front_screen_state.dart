part of 'front_screen_cubit.dart';

@freezed
abstract class FrontScreenState with _$FrontScreenState {
  const factory FrontScreenState.initial({
    @required String title,
    @required List<bool> chosenStatistic,
    @required int chosenIndex,
    @required bool isButtonClicked,
    @required bool isDataReady,
    @required Measurement measurement,
  }) = _Initial;
}
