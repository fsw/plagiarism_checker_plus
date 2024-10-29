/// A library for checking plagiarism using various similarity algorithms.
library plagiarism_checker_plus;

export 'src/checker.dart';
export 'src/algorithms/cosine_similarity.dart';
export 'src/algorithms/jaccard_similarity.dart';
export 'src/algorithms/tfidf_similarity.dart';
export 'src/algorithms/similarity_algorithm.dart';
export 'src/text_processing/text_processor.dart';
export 'src/text_processing/simple_text_processor.dart';
export 'src/text_processing/text_preprocessor.dart';
export 'src/text_processing/advanced_text_preprocessor.dart';

import 'src/checker.dart';

/// A class that provides methods to check plagiarism between two texts.
class PlagiarismCheckerPlus {
  final _checker = PlagiarismChecker();

  /// Checks plagiarism between two texts using the specified algorithm and options.
  ///
  /// [text1] and [text2] are the texts to compare.
  /// [algorithm] specifies the similarity algorithm to use (default is [Algorithm.average]).
  /// [threshold] specifies the similarity threshold for considering plagiarism (default is 0.7).
  /// [caseSensitive] specifies whether the comparison should be case-sensitive (default is false).
  /// [customStopWords] allows specifying a custom list of stop words.
  PlagiarismResult check(String text1, String text2,
      {Algorithm algorithm = Algorithm.average,
      double threshold = 0.7,
      bool caseSensitive = false,
      List<String>? customStopWords}) {
    return _checker.checkPlagiarism(text1, text2,
        algorithm: algorithm,
        threshold: threshold,
        caseSensitive: caseSensitive,
        customStopWords: customStopWords);
  }

  /// Provides detailed similarity scores for each algorithm.
  ///
  /// [text1] and [text2] are the texts to compare.
  Map<String, double> getDetailedResults(String text1, String text2) {
    return _checker.getDetailedResults(text1, text2);
  }
}
