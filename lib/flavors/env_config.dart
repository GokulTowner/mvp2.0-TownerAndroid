import '../imports.dart';

class EnvConfig {
  final String appName;
  final String baseUrl;
  final bool shouldCollectLog;

  late final Logger logger;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    this.shouldCollectLog = true,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: loggerErrorMethodCount_8,
        errorMethodCount: loggerErrorMethodCount_8,
        lineLength: loggerLineLength_120,
        colors: true,
        printEmojis: true,
        // printTime: true,
      ),
    );
  }
}
