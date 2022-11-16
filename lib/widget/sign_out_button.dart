import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/services/auth_service.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> signOut() async {
      await AuthService().signOut();
    }

    return SizedBox(
      width: 115,
      child: OutlinedButton(
        style: TextButton.styleFrom(
          //backgroundColor: Colors.white, // background
          primary: Colors.pinkAccent,
          side: const BorderSide(
            color: Colors.white,
          ),
          // foreground
        ),
        onPressed: () {
          signOut();
        },
        child: const Text(
          'Sign out',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
