part of mohrazium.config;

late LoggerService logger;

LoggerService _setLogger() {
  logger = LoggerService();
  return logger;
}

class LoggerService {
  static final List<String> _logs = [];

  Logger log({Level? level, required message}) {
    final Logger logger = Logger('mohrazium');
    level == null ? logger.log(Level.ALL, message) : logger.log(level, message);
    return logger;
  }

  Logger info(String message) {
    final Logger logger = Logger('mohrazium');
    logger.log(Level.INFO, message);
    return logger;
  }

  Logger warning(String message) {
    final Logger logger = Logger('mohrazium');
    logger.log(Level.WARNING, message);
    return logger;
  }

  Logger error(String message) {
    final Logger logger = Logger('mohrazium');
    logger.log(Level.SEVERE, message);
    return logger;
  }

  static void setup() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) async {
      var log =
          // '${_getPlatformNameAndVersion()}: ${rec.level.name}: ${rec.time.year}-${rec.time.month}-${rec.time.day} ${rec.time.hour}:${rec.time.minute}:${rec.time.second} : ${rec.loggerName} => ${rec.message}'),
          '${rec.level.name}: ${rec.time.year}-${rec.time.month}-${rec.time.day} ${rec.time.hour}:${rec.time.minute}:${rec.time.second} : ${rec.loggerName} => ${rec.message}';
      if (kDebugMode) {
        print(log);
        _logs.add(log);
      }
    });
    _setLogger().log(level: Level.INFO, message: "Logger service is started...");
  }
}
