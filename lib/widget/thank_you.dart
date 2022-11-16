import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/services/auth_service.dart';

class ThankYou extends StatelessWidget {
  ThankYou({super.key});
  final User? user = AuthService().currentUser;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              'https://pngimg.com/uploads/pokemon/pokemon_PNG72.png',
              height: 50,
              width: 50,
            ),
          ),
          Text(
            'Thank you ${user?.displayName ?? user?.email?.replaceFirst('@gmail.com', '')}  ❤️',
            style: const TextStyle(
              color: Color.fromARGB(255, 241, 86, 138),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              'https://pngimg.com/uploads/pokemon/pokemon_PNG125.png',
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
}
