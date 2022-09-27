import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  static final _speechToText = SpeechToText();

  static Future listen({
    required Function(String text) onResult,
    required ValueChanged<bool> onListening,
  }) async {
    if (!_speechToText.isListening) {
      final bool isAlive = await _speechToText.initialize(
        onStatus: (status) => onListening(_speechToText.isListening),
        onError: (error) => log('[ERROR] - $error'),
      );

      if (isAlive) {
        await _speechToText.listen(
          onResult: (result) => onResult(result.recognizedWords),
          pauseFor: const Duration(seconds: 3),
          localeId: 'pt-br',
        );
      }
    } else {
      _speechToText.stop();
    }
  }
}
