import 'package:flutter/material.dart';
import 'package:riverpod_batch_1/first_page.dart';
import 'package:riverpod_batch_1/second_page.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app.g.dart';

@riverpod
class MyCounter extends _$MyCounter {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

@Riverpod(keepAlive: true)
class TnListe extends _$TnListe {
  @override
  List<String> build() {
    return [];
  }

  void add(String name) {
    state = [...state, name];
  }

  void remove(String name) {
    state = [...state]..remove(name);
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Teilnehmerliste',
      home: const FirstPage(),
      routes: {
        FirstPage.routeName: (context) => const FirstPage(),
        SecondPage.routeName: (context) => const SecondPage(),
      },
    );
  }
}
