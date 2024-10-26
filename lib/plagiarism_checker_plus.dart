library plagiarism_checker_plus;

export 'src/checker.dart';
export 'src/algorithms/cosine_similarity.dart';
export 'src/algorithms/jaccard_similarity.dart';

import 'src/checker.dart';

class PlagiarismCheckerPlus {
  final _checker = PlagiarismChecker();

  /// Checks plagiarism between two texts with chosen algorithm and threshold.
  PlagiarismResult check(String text1, String text2,
      {Algorithm algorithm = Algorithm.average, double threshold = 0.7}) {
    return _checker.checkPlagiarism(text1, text2,
        algorithm: algorithm, threshold: threshold);
  }

  /// Returns detailed similarity results for each algorithm.
  Map<String, double> getDetailedResults(String text1, String text2) {
    return _checker.getDetailedResults(text1, text2);
  }
}
