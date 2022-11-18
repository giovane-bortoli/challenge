import 'dart:developer';

import 'package:challenge/main.dart';
import 'package:challenge/src/modules/characters/controller/home_controller.dart';
import 'package:challenge/src/modules/characters/service/service.dart';

import 'package:flutter/material.dart';

import 'src/modules/characters/service/service_interface.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = locator<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getCharacters(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
