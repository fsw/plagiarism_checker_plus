import 'text_preprocessor.dart';

/// A class that preprocesses text by removing stop words and handling case sensitivity.
class AdvancedTextPreprocessor implements TextPreprocessor {
  /// The default list of stop words to remove from the text.
  final List<String> defaultStopWords = [
    'a',
    'an',
    'and',
    'are',
    'as',
    'at',
    'be',
    'but',
    'by',
    'for',
    'if',
    'in',
    'into',
    'is',
    'it',
    'no',
    'not',
    'of',
    'on',
    'or',
    'such',
    'that',
    'the',
    'their',
    'then',
    'there',
    'these',
    'they',
    'this',
    'to',
    'was',
    'will',
    'with'
  ];

  /// Preprocesses the text by removing stop words and handling case sensitivity.
  ///
  /// [text] is the text to preprocess.
  /// [caseSensitive] specifies whether the preprocessing should be case-sensitive (default is false).
  /// [customStopWords] allows specifying a custom list of stop words.
  @override
  String preprocess(String text,
      {bool caseSensitive = false, List<String>? customStopWords}) {
    final stopWords = customStopWords ?? defaultStopWords;
    final words = text.split(RegExp(r'\W+')).where((word) => word.isNotEmpty);

    final filteredWords = words.where((word) {
      final lowerWord = word.toLowerCase();
      return !stopWords.contains(caseSensitive ? word : lowerWord);
    });

    return filteredWords.join(' ');
  }
}
