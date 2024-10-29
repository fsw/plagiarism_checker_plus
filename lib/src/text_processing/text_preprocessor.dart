/// An interface for text preprocessing.
abstract class TextPreprocessor {
  /// Preprocesses the given [text] by optionally handling case sensitivity and removing stop words.
  ///
  /// [caseSensitive] specifies whether the preprocessing should be case-sensitive (default is false).
  /// [customStopWords] allows specifying a custom list of stop words.
  ///
  /// Returns the preprocessed text as a [String].
  String preprocess(String text,
      {bool caseSensitive = false, List<String>? customStopWords});
}
