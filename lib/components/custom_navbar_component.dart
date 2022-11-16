import 'package:flutter/material.dart';

class CustomNavbarComponent extends StatelessWidget {
  const CustomNavbarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF292B37),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
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
            child: const Icon(
              Icons.home,
              size: 26,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              // Navigate Category Page
              Navigator.pushNamed(context, "categoryPage");
            },
            child: const Icon(
              Icons.storage,
              size: 26,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              // Navigate User Page
              Navigator.pushNamed(context, "favoritePage");
            },
            child: const Icon(
              Icons.favorite,
              size: 26,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              // Navigate User Page
              Navigator.pushNamed(context, "userPage");
            },
            child: const Icon(
              Icons.person,
              size: 26,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
