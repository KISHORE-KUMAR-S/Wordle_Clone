import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_settings.dart';
import 'wordle_row.dart';

class WordleGrid extends ConsumerWidget {
  const WordleGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final wordSize = gameSettings.wordSize;

    return Column(
      children: List.generate(
        gameSettings.attempts,
        (index) => WordleRow(wordSize: wordSize),
      ),
    );
  }
}
