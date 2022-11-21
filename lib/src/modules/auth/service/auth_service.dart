// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:challenge/src/core/database/database_client.dart';
import 'package:challenge/src/modules/auth/service/auth_service_interface.dart';

class AuthService extends AuthServiceInterface {
  final DatabaseClient auth;

  AuthService({
    required this.auth,
  });

  @override
  Future<void> forgotPassword({required email}) async {
    try {
      return await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  @override
  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    try {
      return await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  @override
  Stream<User?> stayLogged(User? user) async* {}
}
