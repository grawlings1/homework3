// card_widget.dart
import 'package:flutter/material.dart';
import 'card_model.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  final VoidCallback onTap;

  CardWidget({required this.card, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedBuilder(
        animation: card, 
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(card.isFaceUp ? 0 : 3.14), 
            alignment: Alignment.center,
            child: Container(
              color: card.isFaceUp ? Colors.white : Colors.blue,
              child: Center(
                child: card.isFaceUp
                    ? Text(card.frontImage, style: TextStyle(fontSize: 24)) 
                    : Transform(
                        transform: Matrix4.identity()
                          ..rotateY(3.14), 
                        alignment: Alignment.center,
                        child: Text('?', style: TextStyle(fontSize: 24)), 
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
