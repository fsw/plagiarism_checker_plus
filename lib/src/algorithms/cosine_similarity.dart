import '../text_processing/text_processor.dart';
import 'similarity_algorithm.dart';
import 'dart:math';

/// A class that calculates the similarity between two texts using the Cosine Similarity algorithm.
class CosineSimilarity implements SimilarityAlgorithm {
  final TextProcessor _textProcessor;

  /// Creates a [CosineSimilarity] instance with the specified [TextProcessor].
  CosineSimilarity(this._textProcessor);

  /// Calculates the similarity between [text1] and [text2] using the Cosine Similarity algorithm.
  ///
  /// Returns a similarity score as a [double].
  @override
  double calculate(String text1, String text2) {
    final frequency1 = _textProcessor.processText(text1);
    final frequency2 = _textProcessor.processText(text2);

    final allWords = {...frequency1.keys, ...frequency2.keys};
    final dotProduct = allWords.fold<double>(0, (sum, word) {
      return sum + (frequency1[word] ?? 0) * (frequency2[word] ?? 0);
    });

    final magnitude1 =
        sqrt(frequency1.values.fold(0, (sum, freq) => sum + pow(freq, 2)));
    final magnitude2 =
        sqrt(frequency2.values.fold(0, (sum, freq) => sum + pow(freq, 2)));

    if (magnitude1 == 0 || magnitude2 == 0) {
      return 0.0;
    }
    return dotProduct / (magnitude1 * magnitude2);
  }
}
