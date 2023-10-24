import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_batch_1/mock.dart';

part 'first_page.g.dart';

@riverpod
Future<int> randomNumber(RandomNumberRef ref) {
  return getNumberFuture();
}

@riverpod
Stream<int> randomNumberStream(RandomNumberStreamRef ref) {
  return getNumberStream();
}

class FirstPage extends ConsumerWidget {
  static const routeName = '/FirstPage';
  const FirstPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seite 1'),
      ),
      body: Column(
        children: [
          ref.watch(randomNumberStreamProvider).when(
            data: (zahl) {
              return Text("Neuest Zahl ist: $zahl");
            },
            error: (error, stackTrace) {
              return Text("Fehler: $error");
            },
            loading: () {
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
