import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  Timer? _timer;
  int _timeLeft = 30;

  TimerCubit() : super(TimerInitial(30)) {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        _timeLeft--;
        emit(TimerTick(_timeLeft));
      } else {
        _timer?.cancel();
        emit(TimerFinished());
      }
    });
  }

  void addTime(int seconds) {
    _timeLeft += seconds;
    emit(TimerTick(_timeLeft));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
