import 'package:challenge/main.dart';
import 'package:challenge/src/modules/auth/controller/auth_store.dart';
import 'package:challenge/src/modules/auth/service/errors/handle_firebase_errors.dart';
import 'package:challenge/src/shared/theme/font_theme.dart';
import 'package:challenge/src/shared/utils/app_colors.dart';
import 'package:challenge/src/shared/utils/app_images.dart';
import 'package:challenge/src/shared/widgets/custom_snack_bar.dart';
import 'package:challenge/src/shared/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final authStore = locator<AuthStore>();
  late final ReactionDisposer reactionFirebase;

  @override
  void initState() {
    errorWidget();
    super.initState();
  }

  void errorWidget() {
    reactionFirebase = reaction((_) => authStore.firebaseError, (_) {
      authStore.firebaseError
          ? CustomSnackBar.errorSnackBar(context,
              message: authStore.messageFirebaseError)
          : null;
    });
  }

  @override
  void dispose() {
    reactionFirebase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(context) {
    return Observer(builder: (context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            _loginLogo(),
            _loginTitle(),
            _loginField(),
            _passwordField(),
            _loginButton(),
          ],
        ),
      );
    });
  }

  Widget _loginLogo() => Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: SvgPicture.asset(AppImages.loginLogo),
          ),
        ),
      );

  Widget _loginTitle() => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'LOGIN',
          style: CustomTextTheme.textTheme.headline4,
        ),
      );

  Widget _loginField() => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: CustomTextFormField(
          onChanged: (value) {
            authStore.setEmail(value);
          },
          label: const Text('Email'),
          hint: 'Email',
        ),
      );

  Widget _passwordField() => Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: CustomTextFormField(
          obscureText: !authStore.passwordVisible,
          label: const Text('Senha'),
          hint: 'Senha',
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                if (authStore.passwordVisible == false) {
                  authStore.setPasswordVisible(true);
                } else {
                  authStore.setPasswordVisible(false);
                }
              },
              icon: Icon(authStore.passwordVisible
                  ? Icons.visibility
                  : Icons.visibility_off),
            ),
          ),
          onChanged: (value) {
            authStore.setPassword(value);
          },
        ),
      );

  Widget _loginButton() => SizedBox(
        width: 150,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: ElevatedButton(
            onPressed: () async {
              // final result = await authStore.login(
              //     email: authStore.email, password: authStore.password);
              // if (result == UserCredential) {
              //   Navigator.popAndPushNamed(context, '/events');
              // } else {
              //   errorWidget();
              // }

              try {
                final result = await authStore.login(
                  email: authStore.email,
                  password: authStore.password,
                );
                if (result is UserCredential) {
                  Navigator.popAndPushNamed(context, '/events');
                }
              } catch (e) {
                await HandleFirebaseErrors.getErrorMessageView(e, context);
              }
            },
            child: const Text('LOGIN'),
          ),
        ),
      );
}
