import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/Fetures/Game/Game_view.dart';
import 'package:game/Fetures/Game/manger/cubit/timer_cubit.dart';
import 'package:game/Fetures/Game/manger/grid_cubit/letter_grid_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LetterGridCubit()),
      BlocProvider(create: (context) => TimerCubit())
    ],
    child: const MaterialApp(
      home: GameView(),
    ),
  ));
}
