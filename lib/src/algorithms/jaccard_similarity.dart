class JaccardSimilarity {
  /// Calculates Jaccard similarity between two texts.
  double calculate(String text1, String text2) {
    final words1 = _toWordSet(text1);
    final words2 = _toWordSet(text2);

    final intersection = words1.intersection(words2).length;
    final union = words1.union(words2).length;

    return union == 0 ? 0.0 : intersection / union;
  }

  /// Converts text to a set of words (tokenized, lowercased).
  Set<String> _toWordSet(String text) {
    return text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), '')
        .split(RegExp(r'\s+'))
        .toSet();
  }
}
