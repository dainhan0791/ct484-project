import 'package:flutter/material.dart';

class DisplayStatus extends StatelessWidget {
  const DisplayStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'What to Watch?',
      style: TextStyle(
        color: Colors.white54,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
