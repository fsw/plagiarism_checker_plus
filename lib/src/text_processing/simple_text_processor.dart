import 'text_processor.dart';

/// A simple text processor that converts text to lowercase, removes punctuation, and splits it into words.
class SimpleTextProcessor implements TextProcessor {
  /// Processes the given [text] by converting it to lowercase, removing punctuation, and splitting it into words.
  ///
  /// Returns a [Map] where the keys are words and the values are their frequencies in the text.
  @override
  Map<String, int> processText(String text) {
    final wordList = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), '') // Remove punctuation
        .split(RegExp(r'\s+')); // Split into words

    final wordFrequency = <String, int>{};
    for (var word in wordList) {
      wordFrequency[word] = (wordFrequency[word] ?? 0) + 1;
    }
    return wordFrequency;
  }
}
