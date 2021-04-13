import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:symptoms_monitor/models/measurement/blood_saturation.dart';
import 'package:symptoms_monitor/models/measurement/measurement.dart';

part 'front_screen_state.dart';
part 'front_screen_cubit.freezed.dart';

class FrontScreenCubit extends Cubit<FrontScreenState> {
  FrontScreenCubit()
      : super(
          FrontScreenState.initial(
            chosenStatistic: List<bool>.filled(3, false),
            chosenIndex: 0,
            isButtonClicked: false,
            title: 'START',
            isDataReady: false,
            measurement: Measurement.empty(),
          ),
        );

  void prepareChosenStatisticList() {
    var chosenStats = state.chosenStatistic;
    chosenStats[0] = true;
    emit(
      state.copyWith(chosenStatistic: chosenStats),
    );
  }

  void clickOrReleaseButton() {
    emit(
      state.copyWith(
        isButtonClicked: !state.isButtonClicked,
        isDataReady: false,
      ),
    );
  }

  void resetTitle() {
    emit(
      state.copyWith(
        title: '',
      ),
    );
  }

  void animateTitle() async {
    emit(state.copyWith(
      title: '',
    ));
    String title = state.title;
    if (state.isButtonClicked) {
      String acquisition = "Akwizycja...";
      String ready = "Gotowe!";

      for (int i = 0; i < acquisition.length; i++) {
        await Future.delayed(Duration(milliseconds: 100), () {
          title += acquisition[i];
          emit(state.copyWith(
            title: title,
          ));
        });
      }
      await Future.delayed(Duration(milliseconds: 1500), () async {
        title = "";
        for (int i = 0; i < ready.length; i++) {
          await Future.delayed(Duration(milliseconds: 100), () {
            title += ready[i];
            emit(state.copyWith(
              title: title,
            ));
          });
        }
        emit(state.copyWith(
          isDataReady: true,
        ));
      });
    }
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
}
