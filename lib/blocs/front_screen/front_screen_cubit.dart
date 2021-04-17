import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:symptoms_monitor/domain/measurement/i_measurement_repsitory.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';

part 'front_screen_state.dart';
part 'front_screen_cubit.freezed.dart';

class FrontScreenCubit extends Cubit<FrontScreenState> {
  final IMeasurementRepository repository;

  FrontScreenCubit({@required this.repository})
      : super(FrontScreenState.initial(
          chosenStatistic: List<bool>.filled(3, false),
          chosenIndex: 0,
          isButtonClicked: false,
          title: 'START',
          isDataDownloaded: false,
          measurement: Measurement.empty(),
          lastMeasurementsLoading: false,
          lastMeasurements: [],
          lastMeasurementsHadError: false,
          newMeasurementsHadError: false,
        ));

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

  void onDiscardClick() {
    emit(state.copyWith(
        isButtonClicked: !state.isButtonClicked,
        isDataDownloaded: false,
        title: 'START'));
  }

  void getMeasurement() async {
    String acquisition = 'Akwizycja...';

    clickOrReleaseButton();

    String title = '';
    for (int i = 0; i < acquisition.length; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      title += acquisition[i];
      emit(state.copyWith(
        title: title,
      ));
    }

    final infoAboutListOfMeasurements = await repository.getLimited(1);

    infoAboutListOfMeasurements.fold((failure) {
      showErrorMessage();
    }, (measurements) async {
      showData(measurements: measurements);
    });
  }

  void showData({List<Measurement> measurements}) async {
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

  Future getLastMeasurements(myID) async {
    var allMeasurements = await repository.getAll(myID);
    List<Measurement> lastMeasurements;
    allMeasurements.fold(
        (l) => lastMeasurements = [], (r) => lastMeasurements = r);
    print("siema $lastMeasurements");
    emit(
      state.copyWith(
          lastMeasurementsLoading: false,
          lastMeasurements: lastMeasurements),
    );

    /*

    final infoAboutListOfMeasurements = await repository.getLimited(10);

    // Testing delay while downloading
    await Future.delayed(Duration(seconds: 2));

    infoAboutListOfMeasurements.fold((failure) {
      emit(
        state.copyWith(
          lastMeasurementsHadError: true,
          lastMeasurementsLoading: !state.lastMeasurementsLoading,
        ),
      );
    }, (measurements) {
      emit(
        state.copyWith(
          lastMeasurements: measurements,
          lastMeasurementsLoading: !state.lastMeasurementsLoading,
        ),
      );
    });
    */
  }
}
