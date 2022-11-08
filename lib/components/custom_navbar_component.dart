import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class CustomNavbarComponent extends StatelessWidget {
  const CustomNavbarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF292B37),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              // Navigate Home Page
              Navigator.pushNamed(context, "/");
            },
            child: Icon(
              Icons.home,
              size: 35,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              // Navigate Category Page
              Navigator.pushNamed(context, "categoryPage");
            },
            child: Icon(
              Icons.movie,
              size: 35,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.favorite,
              size: 35,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.person,
              size: 35,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
