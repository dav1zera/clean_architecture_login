import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'asuka_helper.g.dart';

@Injectable(singleton: false)
class AsukaHelper {
  Future<void> showSnackBar(String message) async {
    asuka.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
