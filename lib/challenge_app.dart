import 'package:challenge/home_page.dart';
import 'package:challenge/src/shared/routes/app_routes.dart';
import 'package:challenge/src/shared/theme/theme_data.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeData.materialTheme(context),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes(context),
      initialRoute: '/splash',
    );
  }
}
