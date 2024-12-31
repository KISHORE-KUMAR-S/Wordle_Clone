import 'dart:convert' show jsonDecode;

import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter/services.dart' show rootBundle;

Future<List<String>> loadWords(int wordLength) async {
  try {
    final data =
        await rootBundle.loadString("assets/${wordLength}_letter_words.json");

    // Decode and safely cast the data to List<String>
    final List<dynamic> jsonList = jsonDecode(data);
    final List<String> words = jsonList.map((word) => word.toString()).toList();

    debugPrint("Loaded ${words.length} words for word length $wordLength.");
    return words;
  } catch (e) {
    debugPrint("Error loading words: $e");
    return [];
  }
}
