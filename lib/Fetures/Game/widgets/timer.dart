import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/Fetures/Game/manger/cubit/timer_cubit.dart';

class TimerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        int timeLeft = state.timeLeft;
        return Center(
          child: Text(
            'Time left: $timeLeft seconds',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
