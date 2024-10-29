// plagiarism_checker_plus.dart
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

class PlagiarismCheckerPlus {
  final _checker = PlagiarismChecker();

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

  Map<String, double> getDetailedResults(String text1, String text2) {
    return _checker.getDetailedResults(text1, text2);
  }
}
