import 'text_processor.dart';

class SimpleTextProcessor implements TextProcessor {
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
