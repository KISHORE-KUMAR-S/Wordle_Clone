import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_settings.dart';
import '../providers/game_state.dart';
import 'wordle_row.dart';

class WordleGrid extends ConsumerWidget {
  const WordleGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameState = ref.watch(gameStateProvider);

    final wordSize = gameSettings.wordSize;

    return Column(
      children: List.generate(
        gameSettings.attempts,
        (index) {
          var word = "";

          if (gameState.attempts.length > index) {
            word = gameState.attempts[index];
          }

          return WordleRow(
            wordSize: wordSize,
            word: word,
          );
        },
      ),
    );
  }
}
