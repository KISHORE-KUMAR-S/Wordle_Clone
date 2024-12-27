import 'package:flutter/material.dart';

import 'wordle_grid.dart';
import 'wordle_keyboard.dart';
import 'wordle_title_bar.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WordleTitleBar(),
          WordleGrid(),
          WordleKeyboard(),
        ],
      ),
    );
  }
}
