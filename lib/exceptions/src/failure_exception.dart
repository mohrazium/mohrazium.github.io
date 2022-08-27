// ignore_for_file: constant_identifier_names

part of mohrazium.exceptions;

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
      debugPrint("ERROR:${error.runtimeType} with an error => ${error.toString()}");
    } else if (error is ExceptionLevel) {
      if (error == ExceptionLevel.NOT_FOUND) {
        debugPrint(failureMessage ?? "Your object is null or not found!");
      } else if (error == ExceptionLevel.IGNORE) {
        debugPrint(failureMessage ?? "Your object ignored.");
      }
    }
  }
}
