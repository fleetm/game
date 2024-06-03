import 'package:game/Fetures/Game/data/words.dart';
import 'package:game/Fetures/Game/manger/grid_cubit/letter_grid_cubit.dart';

void main() {
  final cubit = LetterGridCubit();
  String word = cubit.getWord();

  Map<String, bool> checkedKeys = {};

  if (anaimls.keys.contains(word)) {
    // Mark the key as checked
    checkedKeys[word] = true; // this add the word to the new map
    // we need to update the ui on the letter list based on those
  } else {
    //
  }
}

//   // Check if a key has been checked
//   if (checkedKeys[word] == true) {
//     // The key has been checked
//     print('$word has been checked');
//   } else {
//     // The key has not been checked
//     print('$word has not been checked');
//   }
// }
