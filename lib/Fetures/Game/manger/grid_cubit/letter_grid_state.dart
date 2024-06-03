part of 'letter_grid_cubit.dart';

@immutable
sealed class LetterGridState {
  get tappedCells => null;

  get letterGrid => null;
}

final class LetterGridInitial extends LetterGridState {}

final class LetterGridUpdated extends LetterGridState {}
