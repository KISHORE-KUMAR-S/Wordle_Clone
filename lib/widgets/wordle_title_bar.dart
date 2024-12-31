import 'package:flutter/material.dart';
import '../widgets/word_attempts_toggle.dart';
import '../widgets/word_size_toggle.dart';

class WordleTitleBar extends StatelessWidget {
  const WordleTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WordAttemptsToggle(),
        Text(
          "WORDLE",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        WordSizeToggle(),
      ],
    );
  }
}
