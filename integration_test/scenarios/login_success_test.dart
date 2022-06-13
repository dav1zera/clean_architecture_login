import 'package:flutter_test/flutter_test.dart';

import '../robots/robots.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;

  //setUp(() {});

  testWidgets(
    "Teste",
    (WidgetTester widgetTester) async {
      loginRobot = LoginRobot(
        widgetTester: widgetTester,
      );
      homeRobot = HomeRobot(
        widgetTester: widgetTester,
      );

      await loginRobot.startApp();

      await loginRobot.inputEmail();
      await loginRobot.inputPassword();
      await loginRobot.onTapButton();
      await homeRobot.verifyKeyPage();
      await homeRobot.verifyInformationUser();
      await homeRobot.onTapLogout();

      await Future.delayed(
        const Duration(seconds: 2),
      );
    },
  );
}
