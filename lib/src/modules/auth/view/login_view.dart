import 'package:challenge/src/shared/theme/font_theme.dart';
import 'package:challenge/src/shared/utils/app_colors.dart';
import 'package:challenge/src/shared/utils/app_images.dart';
import 'package:challenge/src/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(context) {
    return Column(
      children: [
        _loginLogo(),
        _loginTitle(),
        _loginField(),
        _passwordField(),
      ],
    );
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
          onChanged: (value) {},
          label: const Text('Email'),
          hint: 'Email',
        ),
      );

  Widget _passwordField() => Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: CustomTextFormField(
          label: const Text('Senha'),
          hint: 'Senha',
          onChanged: (value) {},
        ),
      );
}
