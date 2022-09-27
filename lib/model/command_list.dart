import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

class Commands {
  String headerValue;
  List<String> synonyms;

  Commands({
    required this.headerValue,
    this.synonyms = const [],
  });

  factory Commands.fromJson(Map<String, dynamic> json) {
    return Commands(
      headerValue: json['headerValue'] as String,
      synonyms: json['synonyms'] as List<String>,
    );
  }
}

Future<List<Commands>> fetchCommands() async {
  final jsonFile =
      await rootBundle.rootBundle.loadString('/assets/commands.json');

  final list = json.decode(jsonFile) as List<dynamic>;

  return list.map((e) => Commands.fromJson(e)).toList();
}
