import 'dart:async';

void main() {
  print('1'); // Synchronous

  Future(() => print('2')).then((_) => print('3')); // Event queue
  Future.microtask(() => print('4')); // Microtask queue

  print('5'); // Synchronous
}
