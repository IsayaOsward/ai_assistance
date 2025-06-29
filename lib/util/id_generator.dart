import 'dart:math';

String generateId() {
  return DateTime.now().microsecondsSinceEpoch.toString() +
      Random().nextInt(1000).toString();
}
