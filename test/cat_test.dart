// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:vehicle/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vehicle/cat.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<Cat>()])
import 'cat_test.mocks.dart';

void main() {
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
}
