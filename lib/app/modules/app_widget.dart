import 'package:clean_login/app/modules/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: asuka.builder,
      theme: ThemeData(
        primaryColor: ThemeApp.appColor,
      ),
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}
