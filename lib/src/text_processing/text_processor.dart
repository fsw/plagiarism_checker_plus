/// An interface for text processing.
abstract class TextProcessor {
  /// Processes the given [text] and returns a [Map] where the keys are words and the values are their frequencies in the text.
  ///
  /// [text] is the input text to be processed.
  ///
  /// Returns a [Map] with words as keys and their frequencies as values.
  Map<String, int> processText(String text);
}
