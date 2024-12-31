import 'package:flutter/material.dart';
import 'wordle_letter_box.dart';

class WordleRow extends StatelessWidget {
  final int wordSize;
  final String word;
  final String correctWord;
  final bool attempted;

  const WordleRow({
    super.key,
    required this.wordSize,
    required this.word,
    required this.attempted,
    required this.correctWord,
  });

  @override
  Widget build(BuildContext context) {
    final List<WordleLetterBox> boxes = List.generate(wordSize, (index) {
      var letter = "";

      if (word.length > index) {
        letter = word[index];
      }

      return WordleLetterBox(
        position: index,
        letter: letter,
        attempted: attempted,
        correctWord: correctWord,
        word: word,
      );
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
