import 'package:flutter_test/flutter_test.dart';

import 'package:toast_lift/toast_lift.dart';

void main() {
  test('ToastLift.show is available', () {
    expect(ToastLift.show, isA<Function>());
  });
}
