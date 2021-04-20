import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:symptoms_monitor/domain/measurement/i_measurement_repsitory.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';
part 'front_screen_state.dart';
part 'front_screen_cubit.freezed.dart';

class FrontScreenCubit extends Cubit<FrontScreenState> {
  final IMeasurementRepository repository;
  StreamSubscription _streamSubscription;

  FrontScreenCubit({@required this.repository})
      : super(FrontScreenState.initial(
          chosenStatistic: List<bool>.filled(3, false),
          chosenIndex: 0,
          firstFetch: false,
          isButtonClicked: false,
          title: 'START',
          isDataDownloaded: false,
          measurement: Measurement.empty(),
          lastMeasurementsLoading: false,
          lastMeasurements: [],
          lastMeasurementsIDS: [],
          lastMeasurementsHadError: false,
          newMeasurementsHadError: false,
        )) {
    _streamSubscription = repository.streamLastData().listen((event) {
      Measurement measurement = event.first;
      if (state.firstFetch) {
        if (!state.lastMeasurementsIDS.contains(measurement.id)) {
          getMeasurement(measurementInput: measurement);
        }
      }
    });
  }

  void prepareChosenStatisticList() {
    var chosenStats = state.chosenStatistic;
    chosenStats[0] = true;
    emit(
      state.copyWith(chosenStatistic: chosenStats),
    );
  }

  void switchChosenStatistic(int index) {
    var chosenStatistic = state.chosenStatistic;

    for (int i = 0; i < chosenStatistic.length; i++) {
      chosenStatistic[i] = false;
    }

    chosenStatistic[index] = true;

    emit(
      state.copyWith(
        chosenStatistic: chosenStatistic,
        chosenIndex: index,
      ),
    );
  }

  void clickOrReleaseButton() {
    emit(state.copyWith(
      isButtonClicked: !state.isButtonClicked,
    ));
  }

  void onSaveClick() async {
    await save();
    emit(state.copyWith(
        isButtonClicked: !state.isButtonClicked,
        isDataDownloaded: false,
        title: 'START'));
  }

  Future<void> save() async {
    // save measurement in DB;
  }

  void onDiscardClick() async {
    repository.deleteMeasurement(state.measurement.id);
    emit(state.copyWith(
        lastMeasurements: state.lastMeasurements..remove(state.measurement),
        lastMeasurementsIDS: state.lastMeasurementsIDS
          ..remove(state.measurement.id),
        isButtonClicked: !state.isButtonClicked,
        isDataDownloaded: false,
        title: 'OCZEKUJE'));
  }

  void getMeasurement({Measurement measurementInput}) async {
    String acquisition = 'Akwizycja...';

    clickOrReleaseButton();

    String title = '';
    for (int i = 0; i < acquisition.length; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      title += acquisition[i];
      emit(state.copyWith(
        firstFetch: true,
        title: title,
      ));
    }
    if (measurementInput != null) {
      showData(measurement: measurementInput);
    }
  }

  void showData({Measurement measurement}) async {
    String ready = 'Gotowe!';
    String title = '';
    for (int i = 0; i < ready.length; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      title += ready[i];
      emit(state.copyWith(
        title: title,
      ));
    }
    emit(state.copyWith(
      lastMeasurements: state.lastMeasurements..add(measurement),
      lastMeasurementsIDS: state.lastMeasurementsIDS..add(measurement.id),
      measurement: measurement,
      newMeasurementsHadError: false,
      isDataDownloaded: true,
    ));
  }

  void showErrorMessage() {
    emit(state.copyWith(
      newMeasurementsHadError: true,
      isDataDownloaded: true,
      isButtonClicked: !state.isButtonClicked,
      title: 'START',
    ));
  }

  Future getLastMeasurements() async {
    emit(state.copyWith(
      lastMeasurementsLoading: true,
    ));

    final infoAboutListOfMeasurements = await repository.getLimited(10);

    infoAboutListOfMeasurements.fold((failure) {
      emit(
        state.copyWith(
          lastMeasurements: [],
          lastMeasurementsHadError: true,
          lastMeasurementsLoading: false,
        ),
      );
    }, (measurements) {
      final measurementsIDS = measurements.map((r) => r.id).toList();
      if (measurements.isNotEmpty) {
        emit(
          state.copyWith(
            lastMeasurements: measurements,
            lastMeasurementsIDS: measurementsIDS,
            lastMeasurementsLoading: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            lastMeasurements: [Measurement.empty()],
            lastMeasurementsHadError: false,
            lastMeasurementsLoading: false,
          ),
        );
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
