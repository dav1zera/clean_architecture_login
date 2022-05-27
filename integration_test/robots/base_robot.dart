import 'package:flutter_test/flutter_test.dart';
import 'package:clean_login/main.dart' as app;
import 'package:integration_test/integration_test.dart';

abstract class BaseRobot {
  final WidgetTester widgetTester;

  BaseRobot({required this.widgetTester});

  Future<void> startApp() async {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    app.main();
    await widgetTester.pumpAndSettle();
  }
}
