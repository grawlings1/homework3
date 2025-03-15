// card_game_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';
import 'card_widget.dart';

class CardGameScreen extends StatelessWidget {
  final int gridSize = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Matching Game'),
      ),
      body: Consumer<GameProvider>(
        builder: (context, gameProvider, child) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridSize,
            ),
            itemCount: gameProvider.cards.length,
            itemBuilder: (context, index) {
              return CardWidget(
                card: gameProvider.cards[index],
                onTap: () => gameProvider.flipCard(index), 
              );
            },
          );
        },
      ),
    );
  }
}
