class TextProcessor {
  /// Prepares text for similarity checking by tokenizing,
  /// removing punctuation, and creating a frequency map.
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
