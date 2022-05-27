import 'package:clean_login/app/commons/presentation/keys/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_robot.dart';

class LoginRobot extends BaseRobot {
  LoginRobot({required WidgetTester widgetTester})
      : super(widgetTester: widgetTester);

  Future<void> inputEmail() async {
    final inputLogin = find.byKey(ValueKey(loginEmail));
    await widgetTester.enterText(inputLogin, "user@mail.com");
    await widgetTester.pumpAndSettle();
  }

  Future<void> inputPassword() async {
    final inputPassword = find.byKey(ValueKey(loginPassword));
    await widgetTester.enterText(inputPassword, "372130D4v1;");
    await widgetTester.pumpAndSettle();
  }
}
