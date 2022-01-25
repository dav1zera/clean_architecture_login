import '../../../errors/errors.dart';

class ErrorConnection extends Failure {
  @override
  final String message;
  ErrorConnection({required this.message});
}
