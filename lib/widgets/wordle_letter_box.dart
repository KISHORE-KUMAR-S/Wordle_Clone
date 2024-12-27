import 'package:flutter/material.dart';

class WordleLetterBox extends StatelessWidget {
  const WordleLetterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey.shade300,
        width: 2,
      )),
    );
  }
}
