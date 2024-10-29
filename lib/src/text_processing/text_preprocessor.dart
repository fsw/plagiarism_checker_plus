abstract class TextPreprocessor {
  String preprocess(String text,
      {bool caseSensitive = false, List<String>? customStopWords});
}
