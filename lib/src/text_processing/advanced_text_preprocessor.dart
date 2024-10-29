import 'text_preprocessor.dart';

class AdvancedTextPreprocessor implements TextPreprocessor {
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
