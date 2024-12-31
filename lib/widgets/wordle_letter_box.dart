import 'package:flutter/material.dart';

class WordleLetterBox extends StatelessWidget {
  final int position;
  final String letter;
  final String word;
  final String correctWord;
  final bool attempted;

  const WordleLetterBox({
    super.key,
    required this.position,
    required this.letter,
    required this.correctWord,
    required this.attempted,
    required this.word,
  });

  Color? getBackgroundColor() {
    if (!attempted) {
      return null;
    }

    debugPrint("Correct Word: $correctWord");

    if (!correctWord.contains(letter)) {
      return Colors.grey;
    }

    if (correctWord.indexOf(letter) == position) {
      return Colors.green;
    }

    return Colors.orangeAccent;
  }

  BoxBorder? getBorder() {
    if (!attempted) {
      return Border.all(color: Colors.grey, width: 2);
    }

    return null;
  }

  Color? getTextColor() {
    if (!attempted) {
      return Colors.black;
    }

    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: getBorder(),
        color: getBackgroundColor(),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        letter.toUpperCase(),
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: getTextColor(),
        ),
      ),
    );
  }
}
