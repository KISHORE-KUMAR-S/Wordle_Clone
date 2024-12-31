import 'package:flutter/material.dart';
import 'wordle_letter_box.dart';

class WordleRow extends StatelessWidget {
  final int wordSize;
  final String word;

  const WordleRow({
    super.key,
    required this.wordSize,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    final List<WordleLetterBox> boxes = List.generate(wordSize, (index) {
      if (word.length > index) {
        return WordleLetterBox(letter: word[index]);
      }

      return const WordleLetterBox();
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
