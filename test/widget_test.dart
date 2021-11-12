// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hello_world/main.dart';

void main() {
  test('mytest1', () {
    var ans = 10;
    expect(ans, 10);
  });

  test('mytest2', () {
    var param1 = 10;
    var param2 = 20;
    var calc = Calc();
    var ans = calc.add(param1, param2);

    expect(ans, 30);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // 画面を構築
    await tester.pumpWidget(const MyApp());

    //0 が書かれている Widget が1つであることをテスト
    expect(find.text('0'), findsOneWidget);
    //1 が書かれている Widget がないことをテスト
    expect(find.text('1'), findsNothing);

    // アイコンが [+] の Widget をタップする
    await tester.tap(find.byIcon(Icons.add));
    // Widget ツリーの再構築
    await tester.pump();

    //0 が書かれている Widget がないことをテスト
    expect(find.text('0'), findsNothing);
    //1 が書かれている Widget が1つであることをテスト
    expect(find.text('1'), findsOneWidget);
  });
}

class Calc {
  add(int x, int y) {
    return x + y;
  }
}
