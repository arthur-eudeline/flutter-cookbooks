// Import the test package and Counter class
import 'package:test/test.dart';
import 'package:cookbooks_training/cookbooks/12_unit_test/class_test.dart';

void main() {
  group('*** Ma class TEST ***', () {
    test('Counter value should be incremented', () {
      final test = ClassTest();

      test.increment();

      expect(test.value, 1);
    });

    test('Counter value should be decremented', () {
      final test = ClassTest();

      test.decrement();

      expect(test.value, -1);
    });
  });
  test('On devrait avoir du JSON', () async {
    final test = ClassTest();

    var response = await test.getIp();
    expect(response['ip'] != null, true);
  });
}
