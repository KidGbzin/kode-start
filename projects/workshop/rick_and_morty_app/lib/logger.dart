import 'dart:developer' as dart;

import 'package:intl/intl.dart';

/// OBS: Esta classe é um logger criado por mim para a utilização dos meus projetos.
/// Ela foi criada para mostrar os logs mais concisos.
/// Com cores difentes, emojis, timestamp e o arquivo que originou o log.
class Logger {

  Logger._internal();

  static final Logger _instance = Logger._internal();

  factory Logger() => _instance;

  static void download(String message, {StackTrace? stackTrace}) => _log(message, "31", "📥", stackTrace);
  static void error(String message, {StackTrace? stackTrace}) => _log(message, "31", "❌", stackTrace);
  static void information(String message, {StackTrace? stackTrace}) => _log(message, "36", "📣", stackTrace);
  static void start(String message, {StackTrace? stackTrace}) => _log(message, "36", "🚀", stackTrace);
  static void success(String message, {StackTrace? stackTrace}) => _log(message, "32", "✅", stackTrace);
  static void trash(String message, {StackTrace? stackTrace}) => _log(message, "35", "🗑️", stackTrace);
  static void warning(String message, {StackTrace? stackTrace}) => _log(message, "33", "📢", stackTrace);

  /// Internal method that handles message formatting and output.
  ///
  /// Applies color formatting using ANSI codes and writes to both the console and the log file. Each log entry includes:
  /// - A timestamp;
  /// - The originating file (caller);
  /// - The log message;
  /// - An optional stack trace.
  ///
  /// The parameter [code] is the ANSI color code for the console output:
  /// - 30: Black;
  /// - 31: Red;
  /// - 32: Green;
  /// - 33: Yellow;
  /// - 34: Blue;
  /// - 35: Purple;
  /// - 36: Cyan;
  /// - 37: White.
  static void _log(String message, String code, String emoji, StackTrace? stackTrace) {
    final String timestamp = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    final String caller = _caller(StackTrace.current).toUpperCase().padRight(34);

    dart.log(
      ": \x1b[${code}m$emoji $message\x1B[0m",
      name: " $timestamp | $caller ",
      stackTrace: stackTrace,
    );
  }

  /// Extracts the file name of the caller from the [StackTrace].
  ///
  /// This method parses the current stack trace and skips internal frames related to the logger itself or Dart runtime suspensions.
  /// Returns the file name (e.g., `main.dart`) where the log call originated.
  static String _caller(StackTrace stackTrace) {
    final List<String> frames = stackTrace.toString().split('\n');

    for (String frame in frames) {
      if (frame.contains("logger.dart")) continue;
      if (frame.contains('<asynchronous suspension>')) continue;

      final RegExp regex = RegExp(r'\((.+?):(\d+):(\d+)\)');
      final RegExpMatch? match = regex.firstMatch(frame);

      if (match != null) {
        final String path = match.group(1)!;
        final String caller = path.split('/').last;
        
        return caller;
      }
    }
    return 'Unknown';
  }
}