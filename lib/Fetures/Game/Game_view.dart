import 'package:flutter/material.dart';
import 'package:game/Fetures/Game/widgets/Game_view_body.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameViewBody(),
    );
  }
}
