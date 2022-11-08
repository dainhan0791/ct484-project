import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CustomNavbarComponent extends StatelessWidget {
  const CustomNavbarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
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
            child: Icon(
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
            child: Icon(
              Icons.storage,
              size: 26,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
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
            child: Icon(
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
