// card_model.dart
import 'package:flutter/foundation.dart';

class CardModel with ChangeNotifier {
  final int id;
  final String frontImage;
  bool isFaceUp;
  bool isMatched;

  CardModel({
    required this.id,
    required this.frontImage,
    this.isFaceUp = false,
    this.isMatched = false,
  });

  void flip() {
    isFaceUp = !isFaceUp;
    notifyListeners();
  
