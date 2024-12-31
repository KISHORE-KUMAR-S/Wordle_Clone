import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_settings.dart';

class WordSizeToggle extends ConsumerWidget {
  const WordSizeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameSettingsNotifier = ref.watch(gameSettingsProvider.notifier);

    void updateWordSize() {
      var newWordSize = 5;

      if (gameSettings.wordSize == 4) {
        newWordSize = 5;
      } else if (gameSettings.wordSize == 5) {
        newWordSize = 6;
      } else {
        newWordSize = 4;
      }

      gameSettingsNotifier.updateWordSize(newWordSize);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: OutlinedButton(
        onPressed: updateWordSize,
        child: Text(gameSettings.wordSize.toString()),
      ),
    );
  }
}
