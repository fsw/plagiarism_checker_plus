/// An interface for similarity algorithms.
abstract class SimilarityAlgorithm {
  /// Calculates the similarity between [text1] and [text2].
  ///
  /// Returns a similarity score as a [double].
  double calculate(String text1, String text2);
}
