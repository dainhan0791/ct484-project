import 'package:flutter/material.dart';

class MoviePageButtonComponent extends StatelessWidget {
  const MoviePageButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF292B37),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 26,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF292B37),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 26,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF292B37),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.download,
              color: Colors.white,
              size: 26,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF292B37),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.share,
              color: Colors.white,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
