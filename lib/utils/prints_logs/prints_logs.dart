import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

void printLogs(Map<String, dynamic> logs, StackTrace? stackTrace){
  if (kDebugMode) {
    log(
      '''
        ---------------------------
          ${const JsonEncoder.withIndent('  ').convert(logs)}
        ---------------------------
        ''',
      stackTrace: stackTrace,
    );
  }
}