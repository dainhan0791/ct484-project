import 'package:flutter/material.dart';

class MoviePageButtonComponent extends StatelessWidget {
  const MoviePageButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF292B37),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF292B37),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF292B37),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.download,
              color: Colors.white,
              size: 35,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF292B37),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.share,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
