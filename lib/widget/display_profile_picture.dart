import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/services/auth_service.dart';

class DisPlayProfilePicture extends StatelessWidget {
  DisPlayProfilePicture({super.key});
  final User? user = AuthService().currentUser;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        '${user?.photoURL ?? 'https://www.pngplay.com/wp-content/uploads/10/Pokemon-PNG-Images-HD.png'}  ',
        height: 56,
        width: 56,
      ),
    );
  }
}
