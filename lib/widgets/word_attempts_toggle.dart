import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_settings.dart';

class WordAttemptsToggle extends ConsumerWidget {
  const WordAttemptsToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameSettingsNotifier = ref.watch(gameSettingsProvider.notifier);

    String text = "";

    void updateAttemptsLimit() {
      var newAttempts = 4;

      if (gameSettings.attempts == 4) {
        newAttempts = 5;
      } else if (gameSettings.attempts == 5) {
        newAttempts = 6;
      } else {
        newAttempts = 4;
      }

      gameSettingsNotifier.updateAttempts(newAttempts);
    }

    if (gameSettings.attempts == 4) {
      text = "LOW";
    } else if (gameSettings.attempts == 5) {
      text = "MEDIUM";
    } else if (gameSettings.attempts == 6) {
      text = "HIGH";
    } else {
      text = "LOW";
    }

    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: OutlinedButton(
        onPressed: updateAttemptsLimit,
        child: Text(text),
      ),
    );
  }
}
