part of mohrazium.exceptions;

class ErrorException extends FailureException {
  final ExceptionType type;
  final String? errorMessage;
  ErrorException(
      {required this.type,
      this.errorMessage,
      String? failureMessage,
      Object? error,
      StackTrace? stackTrace})
      : super(
            failureMessage: failureMessage,
            error: error,
            stackTrace: stackTrace);

  String get message {
    var msg = "";
    switch (type) {
      case ExceptionType.NotSAVE:
        // TODO: Handle this case.
        break;
      case ExceptionType.NotUPDATE:
        // TODO: Handle this case.
        break;
      case ExceptionType.NotFOUND:
        // TODO: Handle this case.
        break;
      case ExceptionType.NotDELETE:
        // TODO: Handle this case.
        break;
      case ExceptionType.FAILED:
        // TODO: Handle this case.
        break;
      case ExceptionType.NotALLOWED:
        // TODO: Handle this case.
        break;
      case ExceptionType.IsEXPIRED:
        // TODO: Handle this case.
        break;
      case ExceptionType.NotACTIVE:
        // TODO: Handle this case.
        break;
      case ExceptionType.NotREGISTER:
        // TODO: Handle this case.
        break;
      case ExceptionType.NotCONFIRM:
        // TODO: Handle this case.
        break;
      case ExceptionType.IsDUPLICATED:
        // TODO: Handle this case.
        break;
      case ExceptionType.NotSEND:
        // TODO: Handle this case.
        break;
      case ExceptionType.NotRECEIVE:
        // TODO: Handle this case.
        break;
      case ExceptionType.NotRETRIEVE:
        // TODO: Handle this case.
        break;
      case ExceptionType.UNSUCCESS:
        // TODO: Handle this case.
        break;
      case ExceptionType.UNAVAILABLE:
        // TODO: Handle this case.
        break;
      case ExceptionType.RESTRICTED:
        // TODO: Handle this case.
        break;
      case ExceptionType.LOCKED:
        // TODO: Handle this case.
        break;
      case ExceptionType.NotMATCH:
        // TODO: Handle this case.
        break;
    }
    return "$msg ${errorMessage ?? ""}";
  }

  @override
  String toString() => 'ErrorException(type: $type)=> ${super.toString()}';
}
