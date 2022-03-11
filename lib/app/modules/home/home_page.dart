import 'package:clean_login/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key? key,
    this.title = "Home",
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF539FCB),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.onTapLogout();
        },
        child: const Icon(
          Icons.exit_to_app,
          color: Colors.white,
        ),
      ),
    );
  }
}
