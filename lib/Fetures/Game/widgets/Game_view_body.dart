import 'package:flutter/material.dart';
import 'package:game/Fetures/Game/widgets/letters_grid.dart';
import 'package:game/Fetures/Game/widgets/timer.dart';
import 'package:game/Fetures/Game/widgets/words_list.dart';
import 'package:gap/gap.dart';

class GameViewBody extends StatelessWidget {
  const GameViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            TimerWidget(),

            WordsList(), // list for the words
            const Gap(20),
            const Text('Your Answer'),
            Lettergrid(),
          ],
        ),
      ),
    );
  }
}
