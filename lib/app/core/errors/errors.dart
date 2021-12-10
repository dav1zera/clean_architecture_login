import 'package:flutter/cupertino.dart';

abstract class Failure implements Exception {
  String get message;
}
