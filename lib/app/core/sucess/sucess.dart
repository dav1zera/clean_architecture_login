import 'package:clean_login/app/core/errors/errors.dart';
import 'package:flutter/cupertino.dart';

abstract class Sucess implements Failure {
  String get message;
}
