import 'package:speech_recognizer/model/command_list.dart';

class CommandAnalyzer {
  static Future<String> analize({required final String request}) async {
    String command = '';
    List<Commands> commandList = await fetchCommands();

    for (var value in commandList) {
      if (value.headerValue.toLowerCase() == request.toLowerCase()) {
        command = value.headerValue.toLowerCase();
        break;
      } else {
        for (var syn in value.synonyms) {
          if (syn.toLowerCase() == request.toLowerCase()) {
            command = value.headerValue.toLowerCase();
            break;
          }
        }
      }
    }

    return command;
  }
}
