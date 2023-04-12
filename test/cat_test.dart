import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vehicle/cat.dart';

import 'cat_test.mocks.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<Cat>()])
void main() {
  group('Cat Test Group', () {
    // Create mock object.
    var cat = MockCat();
    test('test 1', () {
      // Stub a mock method before interacting.
      when(cat.sound()).thenReturn("Purr");
      expect(cat.sound(), "Purr");
    });

    test('test 2', () {
// You can call it again.
      expect(cat.sound(), "Purr");
    });

    test('test 3', () {
// Let's change the stub.
      when(cat.sound()).thenReturn("Meow");
      expect(cat.sound(), "Meow");
    });

    test('test 4', () {
// You can stub getters.
      when(cat.lives).thenReturn(9);
      expect(cat.lives, 9);
    });

    test('test 5', () {
// You can stub a method to throw.
      when(cat.lives).thenThrow(RangeError('Boo'));
      expect(() => cat.lives, throwsRangeError);
    });
    test('test 6', () {
// We can calculate a response at call time.
      var responses = ["Purr", "Meow"];
      when(cat.sound()).thenAnswer((_) => responses.removeAt(0));
      expect(cat.sound(), "Purr");
      expect(cat.sound(), "Meow");
    });
  });
}
