import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_batch_1/app.dart';

class SecondPage extends ConsumerWidget {
  static const routeName = '/SecondPage';
  const SecondPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> tnListe = ref.watch(tnListeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seite 2'),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(tnListe[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ref.read(tnListeProvider.notifier).remove(tnListe[index]);
                  },
                ),
              );
            },
            itemCount: tnListe.length,
          ),
        ],
      ),
    );
  }
}
