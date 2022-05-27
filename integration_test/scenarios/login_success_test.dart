import 'package:flutter_test/flutter_test.dart';

import '../robots/login_robot.dart';

void main() {
  late LoginRobot loginRobot;

  //setUp(() {});

  testWidgets("Teste", (WidgetTester widgetTester) async {
    loginRobot = LoginRobot(
      widgetTester: widgetTester,
    );

    await loginRobot.startApp();

    await loginRobot.inputEmail();
    await loginRobot.inputPassword();

    await Future.delayed(
      const Duration(seconds: 1),
    );

    expect(find.text("user@mail.com"), findsOneWidget);
    expect(find.text("372130D4v1;"), findsOneWidget);
  });
}
