import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/services/auth_service.dart';

class DisplayName extends StatelessWidget {
  DisplayName({super.key});
  final User? user = AuthService().currentUser;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hi! ${user?.displayName ?? user?.email?.replaceFirst('@gmail.com', '')}  ❤️',
      // user?.email?.replaceAll('@gmail.com', '') ?? 'User does not exist',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
