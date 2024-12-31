import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/wordle_repo.dart';
import 'game_settings.dart';

class GameState {
  final GameSettings settings;
  final List<String> validWords;
  final List<String> attempts;
  final String correctWord;
  final int attempted;

  GameState({
    required this.settings,
    required this.validWords,
    required this.correctWord,
    required this.attempted,
    required this.attempts,
  });

  GameState clone({
    List<String>? validWords,
    List<String>? attempts,
    String? correctWord,
    int? attempted,
    GameSettings? settings,
  }) {
    return GameState(
      settings: settings ?? this.settings,
      validWords: validWords ?? this.validWords,
      correctWord: correctWord ?? this.correctWord,
      attempts: attempts ?? this.attempts,
      attempted: attempted ?? this.attempted,
    );
  }
}

class GameStateNotifier extends StateNotifier<GameState> {
  final Random rng = Random();

  GameStateNotifier(GameSettings settings)
      : super(
          GameState(
            validWords: [],
            correctWord: "begin",
            settings: settings,
            attempts: [],
            attempted: 0,
          ),
        );

  Future<void> updateWords() async {
    final words = await loadWords(state.settings.wordSize);
    debugPrint(words.toString());
    state = state.clone(correctWord: words[rng.nextInt(words.length)]);
  }

  void newCorrectWord() {
    state = state.clone(
      correctWord: state.validWords[rng.nextInt(state.validWords.length - 1)],
    );
  }

  void updateCurrentAttempt(String key) {
    if (key == "_") {
      // Handle "Enter" Key
    } else if (key == "<") {
      // Handle "Backspace" Key
    } else {
      final attempts = state.attempts;

      if (attempts.length <= state.settings.wordSize) {
        attempts.add("");
      }

      var currentAttempt = attempts[state.attempted];

      if (currentAttempt.length >= state.settings.wordSize) {
        debugPrint("Trying to type word longer than correct word length");

        return;
      }

      currentAttempt += key;
      debugPrint(currentAttempt);

      attempts[state.attempted] = currentAttempt;
      state = state.clone(attempts: attempts);
    }
  }
}

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>(
  (ref) {
    final settings = ref.watch(gameSettingsProvider);
    final gameStateNotifier = GameStateNotifier(settings);
    gameStateNotifier.updateWords();

    return gameStateNotifier;
  },
);
