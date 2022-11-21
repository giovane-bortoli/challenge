import 'package:challenge/src/shared/widgets/custom_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class HandleFirebaseErrors {
  static Future getErrorMessageView(e, BuildContext context) async {
    try {
      throw e;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return CustomSnackBar.errorSnackBar(context,
            message: 'E-mail incorreto!');
      } else if (e.code == 'wrong-password') {
        return CustomSnackBar.errorSnackBar(context,
            message: 'Senha incorreta!');
      } else if (e.code == 'user-not-found') {
        return CustomSnackBar.errorSnackBar(context,
            message: 'E-mail não encontrado!');
      } else {
        return CustomSnackBar.errorSnackBar(context,
            message: 'Ocorreu um erro, tente novamente!');
      }
    } catch (_) {}
  }
}
