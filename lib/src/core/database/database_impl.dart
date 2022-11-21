// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:challenge/src/core/database/database_client.dart';

class DatabaseImpl implements DatabaseClient {
  final FirebaseAuth auth;
  DatabaseImpl({
    required this.auth,
  });

  @override
  Future<void> sendPasswordResetEmail(
      {required String email, ActionCodeSettings? actionCodeSettings}) async {
    return await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    return auth.signOut();
  }

  @override
  Stream<User?> authStateChanges(User? user) async* {}
}
