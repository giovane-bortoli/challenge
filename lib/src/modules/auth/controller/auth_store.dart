// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:challenge/src/modules/auth/service/auth_service_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final AuthServiceInterface auth;

  _AuthStoreBase({
    required this.auth,
  });

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void setPasswordVisible(bool value) => passwordVisible = value;

  @observable
  String messageFirebaseError = '';
  @action
  void setMessageFirebaseError(String value) => messageFirebaseError = value;

  @observable
  bool firebaseError = false;
  @action
  void setFirebaseError(bool value) => firebaseError = value;

  @action
  Future<UserCredential?> login(
      {required String email, required String password}) async {
    try {
      return await auth.signIn(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setFirebaseError(true);
        setMessageFirebaseError('Usuário não encontrado!');
      } else if (e.code == 'wrong-password') {
        setFirebaseError(true);
        setMessageFirebaseError('Usuário ou senha incorreta!');
      } else if (e.code == 'invalid-email') {
        setFirebaseError(true);
        setMessageFirebaseError('Email incorreto');
      } else {
        setFirebaseError(true);
        setMessageFirebaseError('Ocorreu um erro, tente novamente!');
      }
    }
    return null;
  }

  @action
  Future<void> logOut() async {
    await auth.signOut();
  }
}
