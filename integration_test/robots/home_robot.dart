import 'package:clean_login/app/commons/presentation/keys/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_robot.dart';

class HomeRobot extends BaseRobot {
  HomeRobot({required WidgetTester widgetTester})
      : super(widgetTester: widgetTester);

  Future<void> verifyKeyPage() async {
    await find.byKey(Key(homePage));
  }

  Future<void> verifyInformationUser() async {
    final emailFinder = await find.text("Seu Email: teste010@gmail.com");
    final userFinder = await find.text("Seu Nome: Davi Teste");
    final idFinder = await find.text("Seu ID: KXWoriD9OpUkMtShw4FPyuV9Jxg1");
    final logoutFinder = await find.byKey(Key(logoutButton));

    expect(emailFinder, findsOneWidget);
    expect(userFinder, findsOneWidget);
    expect(idFinder, findsOneWidget);
    expect(logoutFinder, findsOneWidget);
    await widgetTester.pumpAndSettle();
  }

  Future<void> onTapLogout() async {
    final logoutFinder = await find.byKey(Key(logoutButton));
    await widgetTester.tap(logoutFinder);
    await widgetTester.pumpAndSettle();
  }
}
