// ignore_for_file: constant_identifier_names

part of zoncan.exceptions;

class FailureException implements Failure {
  late final String? failureMessage;
  final Object? error;
  final StackTrace? stackTrace;

  FailureException({
    this.failureMessage,
    this.error,
    this.stackTrace,
  }) {
    _handleException();
  }

  @override
  String toString() => failureMessage ?? "";

  void _handleException() {
    if (error is Exception) {
      logger.error("${error.runtimeType} with an error => ${error.toString()}");
    } else if (error is ExceptionLevel) {
      if (error == ExceptionLevel.NOT_FOUND) {
        logger.info(failureMessage ?? "Your object is null or not found!");
      } else if (error == ExceptionLevel.IGNORE) {
        logger.info(failureMessage ?? "Your object ignored.");
      }
    }
  }
}
