// game_provider.dart
import 'package:flutter/material.dart';
import 'card_model.dart';

class GameProvider with ChangeNotifier {
  List<CardModel> cards = [];
  List<int> flippedCards = [];

  GameProvider() {
    initializeCards();
  }

  void initializeCards() {
    List<String> images = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
    images = images + images; 
    images.shuffle();

    cards = List.generate(images.length, (index) {
      return CardModel(
        id: index,
        frontImage: images[index],
      );
    });
  }

  void flipCard(int index) {
    if (flippedCards.length < 2 && !cards[index].isFaceUp) {
      cards[index].flip(); 
      flippedCards.add(index);
      notifyListeners(); 

      if (flippedCards.length == 2) {
        checkForMatch();
      }
    }
  }

  void checkForMatch() {
    final firstCard = cards[flippedCards[0]];
    final secondCard = cards[flippedCards[1]];

    if (firstCard.frontImage == secondCard.frontImage) {
      firstCard.isMatched = true;
      secondCard.isMatched = true;
    } else {
      Future.delayed(Duration(seconds: 1), () {
        firstCard.flip(); 
        secondCard.flip(); 
        notifyListeners();
      });
    }

    flippedCards.clear();
  }
}
