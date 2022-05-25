import 'package:clean_login/app/commons/domain/errors/errors.dart';

class ErrorConnection extends Failure {
  @override
  final String message;
  ErrorConnection({required this.message});
}
