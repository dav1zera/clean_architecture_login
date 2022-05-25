import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

class AsukaHelper {
  Future<void> showSnackBar(String message) async {
    asuka.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
