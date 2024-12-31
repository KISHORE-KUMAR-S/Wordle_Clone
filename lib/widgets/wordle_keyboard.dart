import 'package:flutter/material.dart';
import 'wordle_key.dart';

class WordleKeyboard extends StatelessWidget {
  const WordleKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildKeyRows("qwertyuiop"),
        buildKeyRows("asdfghjkl"),
        buildKeyRows("_zxcvbnm<"),
      ],
    );
  }

  Widget buildKeyRows(String keys) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [for (var key in keys.split("")) WordleKey(key)],
    );
  }
}
