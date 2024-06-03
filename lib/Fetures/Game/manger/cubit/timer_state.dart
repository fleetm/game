part of 'timer_cubit.dart';

@immutable
abstract class TimerState {
  final int timeLeft;
  const TimerState(this.timeLeft);
}

class TimerInitial extends TimerState {
  const TimerInitial(int timeLeft) : super(timeLeft);
}

class TimerTick extends TimerState {
  const TimerTick(int timeLeft) : super(timeLeft);
}

class TimerFinished extends TimerState {
  const TimerFinished() : super(0);
}
