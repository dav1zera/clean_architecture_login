import 'package:clean_login/app/commons/presentation/keys/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_robot.dart';

class LoginRobot extends BaseRobot {
  LoginRobot({required WidgetTester widgetTester})
      : super(widgetTester: widgetTester);

  Future<void> inputEmail() async {
    final inputLogin = find.byKey(Key(loginEmail));
    await widgetTester.enterText(inputLogin, "user@mail.com");
    await widgetTester.pumpAndSettle();
  }

  Future<void> inputPassword() async {
    final inputPassword = find.byKey(Key(loginPassword));
    await widgetTester.enterText(inputPassword, "372130D4v1;");
    await widgetTester.pumpAndSettle();
  }

  Future<void> onTapButton() async {
    final buttonLogin = find.byKey(Key(tapButtonLogin));
    await widgetTester.testTextInput.receiveAction(TextInputAction.done);
    await widgetTester.tap(buttonLogin);
    await widgetTester.pumpAndSettle();
  }
}
