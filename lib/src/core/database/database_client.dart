import 'package:firebase_auth/firebase_auth.dart';

abstract class DatabaseClient {
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signOut();

  Future<void> sendPasswordResetEmail(
      {required String email, ActionCodeSettings? actionCodeSettings});

  Stream<User?> authStateChanges(User? user);
}
