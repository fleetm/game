import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'letter_grid_state.dart';

class LetterGridCubit extends Cubit<LetterGridState> {
  final List<List<String>> letterGrid = [
    ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'],
    ['K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T'],
    ['U', 'V', 'W', 'X', 'Y', 'Z', 'A', 'B', 'C', 'D'],
    ['E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'],
  ];

  final Set<String> tappedCells = {};
  String word = '';

  LetterGridCubit() : super(LetterGridInitial());

  List<List<String>> getLetterGrid() {
    return letterGrid;
  }

  Set<String> getTappedCells() {
    return tappedCells;
  }

  String getWord() {
    return word;
  }

  void changeColor(int rowIndex, int colIndex) {
    String cellKey = '$rowIndex-$colIndex';
    String letter = letterGrid[rowIndex][colIndex];
    if (tappedCells.contains(cellKey)) {
      tappedCells.remove(cellKey);
      word = word.replaceAll(letter, '');
    } else {
      tappedCells.add(cellKey);
      word += letter;
      print(word);
    }
    emit(LetterGridUpdated());
  }

  void resetWord() {
    word = '';
    tappedCells.clear();
    emit(LetterGridUpdated());
  }
}
