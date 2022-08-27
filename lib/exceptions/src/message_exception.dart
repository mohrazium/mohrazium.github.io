part of mohrazium.exceptions;

class MessageException implements Failure {
  late final String? message;
  final ExceptionLevel level;

  MessageException(this.message, {this.level = ExceptionLevel.INFO}) {
    _handle();
  }

  @override
  String toString() => message ?? "";

  void _handle() {
    switch (level) {
      case ExceptionLevel.INFO:
      case ExceptionLevel.NOT_FOUND:
      case ExceptionLevel.IGNORE:
        debugPrint("${level.name} message was thrown with content : $message");
        break;
      case ExceptionLevel.WARNING:
       debugPrint(
            "WARNING : ${level.name} message was thrown with content : $message");
        break;
      case ExceptionLevel.ERROR:
       debugPrint("ERROR : ${level.name} message was thrown with content : $message");
        break;
    }
  }
}
