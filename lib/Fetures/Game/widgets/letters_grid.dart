import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/Fetures/Game/manger/grid_cubit/letter_grid_cubit.dart';

class Lettergrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final letterGrid = context.read<LetterGridCubit>().letterGrid;
    return BlocBuilder<LetterGridCubit, LetterGridState>(
      builder: (context, state) {
        final tappedCells = context.read<LetterGridCubit>().tappedCells;
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: letterGrid.asMap().entries.map((entry) {
                  int rowIndex = entry.key;
                  List<String> row = entry.value;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: row.asMap().entries.map((entry) {
                      int colIndex = entry.key;
                      String letter = entry.value;
                      bool isTapped =
                          tappedCells.contains('$rowIndex-$colIndex');
                      return GestureDetector(
                        onTap: () => context
                            .read<LetterGridCubit>()
                            .changeColor(rowIndex, colIndex),
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: isTapped ? Colors.green : Colors.white,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            letter,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
