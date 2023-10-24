import 'dart:math';

Future<int> getNumberFuture({bool fails = false}) async {
  await Future.delayed(const Duration(seconds: 3));
  if (fails) {
    throw Exception('Failed to get number');
  } else {
    return Random().nextInt(100);
  }
}

Stream<int> getNumberStream({bool fails = false}) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 3));
    if (fails) {
      throw Exception('Failed to get number');
    } else {
      yield Random().nextInt(100);
    }
  }
}
