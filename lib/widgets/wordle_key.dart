import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_state.dart';

class WordleKey extends ConsumerWidget {
  final String letter;
  const WordleKey(this.letter, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget keyCap;
    double width = 100;

    if (letter == "_" || letter == "<") {
      keyCap = Icon(
        letter == "_" ? Icons.keyboard_return : Icons.backspace_outlined,
        size: 18,
      );
    } else {
      width = 60;

      keyCap = Text(
        letter.toUpperCase(),
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
    }

    return InkWell(
      onTap: () {
        ref.read(gameStateProvider.notifier).updateCurrentAttempt(letter);
      },
      child: Container(
        width: width,
        height: 60,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(44, 44, 44, 44),
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: keyCap,
      ),
    );
  }
}
