import 'package:flutter/material.dart';
import 'wordle_letter_box.dart';

class WordleRow extends StatelessWidget {
  final int wordSize;
  const WordleRow({super.key, required this.wordSize});

  @override
  Widget build(BuildContext context) {
    final List<WordleLetterBox> boxes =
        List.generate(wordSize, (index) => const WordleLetterBox());

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
