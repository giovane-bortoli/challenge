import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarWidget extends StatelessWidget {
  const StatusBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        height: 30,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.transparent),
      ),
    );
  }
}
