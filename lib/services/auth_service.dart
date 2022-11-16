import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  final user = FirebaseAuth.instance.currentUser;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email.toString().trim(),
      password: password.toString().trim(),
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email.toString().trim(),
      password: password.toString().trim(),
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> updateDisplayname({
    required String name,
  }) async {
    await _firebaseAuth.currentUser?.updateDisplayName(name.toString().trim());
  }

  Future<void> updatePhotoURL({
    required String profileUrl,
  }) async {
    await _firebaseAuth.currentUser
        ?.updatePhotoURL(profileUrl.toString().trim());
  }

  Future<void> resetPassword({
    required String password,
  }) async {
    await _firebaseAuth.currentUser?.updatePassword(password.toString().trim());
  }

  Future<void> deleteUser() async {
    await _firebaseAuth.currentUser?.delete();
  }
}
