import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/Fetures/Game/data/words.dart';
import 'package:game/Fetures/Game/manger/cubit/timer_cubit.dart';
import 'package:game/Fetures/Game/manger/grid_cubit/letter_grid_cubit.dart';

class WordsList extends StatelessWidget {
  WordsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LetterGridCubit, LetterGridState>(
      builder: (context, state) {
        if (state is LetterGridUpdated) {
          String userInput =
              context.read<LetterGridCubit>().getWord().toUpperCase();
          String? arabicTranslation = anaimls[userInput];
          if (arabicTranslation != null) {
            print('Translation for $userInput is: $arabicTranslation');

            bool isCorrectWord = anaimls.containsKey(userInput);

            if (isCorrectWord) {
              context.read<LetterGridCubit>().resetWord();
              anaimls.remove(userInput);
              print('Animal $userInput marked as solved.\n');

              context.read<TimerCubit>().addTime(30);
              print('Adding time...');
            } else {
              print('Entered word $userInput is not correct.\n');
            }
          } else {}
        }
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.width / 2,
            child: ListView.builder(
              itemCount: anaimls.keys.length,
              itemBuilder: (context, index) {
                String word = anaimls.keys.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    color: const Color.fromARGB(255, 243, 240, 240),
                    child: ListTile(
                      title: Center(
                        child: Text(
                          anaimls[word]!,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
