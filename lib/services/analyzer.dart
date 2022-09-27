import 'package:speech_recognizer/services/command_analyzer.dart';
import 'package:speech_recognizer/services/speech_service.dart';

class Analyzer {
  static Future<String> analize() async {
    String response = "";
    String command = "";
    bool isListening = false;

    SpeechService.listen(
      onResult: (value) => {
        command = value,
      },
      onListening: (value) async {
        isListening = value;
        if (!isListening && response != '') {
          (() async {
            response = await CommandAnalyzer.analize(request: command);
          });
        } else {
          command = '';
          response = '';
        }
      },
    );

    return response;
  }
}
