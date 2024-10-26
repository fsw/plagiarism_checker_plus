import 'algorithms/cosine_similarity.dart';
import 'algorithms/jaccard_similarity.dart';

enum Algorithm { cosine, jaccard, average }

class PlagiarismResult {
  final double score;
  final String algorithm;
  final bool isPlagiarized;

  PlagiarismResult({
    required this.score,
    required this.algorithm,
    required this.isPlagiarized,
  });
}

class PlagiarismChecker {
  final _cosineSimilarity = CosineSimilarity();
  final _jaccardSimilarity = JaccardSimilarity();

  /// Checks plagiarism between two texts based on selected algorithm and threshold.
  PlagiarismResult checkPlagiarism(String text1, String text2,
      {Algorithm algorithm = Algorithm.average, double threshold = 0.7}) {
    double similarityScore;
    String algorithmUsed;

    switch (algorithm) {
      case Algorithm.cosine:
        similarityScore = _cosineSimilarity.calculate(text1, text2);
        algorithmUsed = 'Cosine Similarity';
        break;
      case Algorithm.jaccard:
        similarityScore = _jaccardSimilarity.calculate(text1, text2);
        algorithmUsed = 'Jaccard Similarity';
        break;
      case Algorithm.average:
      default:
        similarityScore = (_cosineSimilarity.calculate(text1, text2) +
                _jaccardSimilarity.calculate(text1, text2)) /
            2;
        algorithmUsed = 'Average Similarity';
        break;
    }

    bool isPlagiarized = similarityScore >= threshold;

    return PlagiarismResult(
      score: double.parse(similarityScore.toStringAsFixed(2)),
      algorithm: algorithmUsed,
      isPlagiarized: isPlagiarized,
    );
  }

  /// Provides a detailed result with individual algorithm scores.
  Map<String, double> getDetailedResults(String text1, String text2) {
    final cosineScore = _cosineSimilarity.calculate(text1, text2);
    final jaccardScore = _jaccardSimilarity.calculate(text1, text2);
    final averageScore = (cosineScore + jaccardScore) / 2;

    return {
      'Cosine Similarity': cosineScore,
      'Jaccard Similarity': jaccardScore,
      'Average Similarity': averageScore,
    };
  }
}
