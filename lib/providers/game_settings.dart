import 'package:flutter_riverpod/flutter_riverpod.dart'
    show StateNotifier, StateNotifierProvider;

class GameSettings {
  final int wordSize;
  final int attempts;

  GameSettings({
    required this.wordSize,
    required this.attempts,
  });

  GameSettings clone({int? wordSize, int? attempts}) {
    return GameSettings(
      attempts: attempts ?? this.attempts,
      wordSize: wordSize ?? this.wordSize,
    );
  }
}

class GameSettingsNotifier extends StateNotifier<GameSettings> {
  GameSettingsNotifier() : super(GameSettings(wordSize: 5, attempts: 6));

  void updateAttempts(int attempts) => state = state.clone(attempts: attempts);
  void updateWordSize(int wordSize) => state = state.clone(wordSize: wordSize);
}

final gameSettingsProvider =
    StateNotifierProvider<GameSettingsNotifier, GameSettings>(
  (ref) => GameSettingsNotifier(),
);
