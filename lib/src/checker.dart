// src/checker.dart
import '../plagiarism_checker_plus.dart';
import 'algorithms/tfidf_similarity.dart';
import 'text_processing/text_preprocessor.dart';
import 'text_processing/advanced_text_preprocessor.dart';

enum Algorithm { cosine, jaccard, tfidf, average }

class PlagiarismResult {
  final double similarityScore;
  final String algorithm;
  final bool isPlagiarized;

  PlagiarismResult({
    required this.similarityScore,
    required this.algorithm,
    required this.isPlagiarized,
  });
}

class PlagiarismChecker {
  final TextProcessor _textProcessor;
  final TextPreprocessor _textPreprocessor;
  late final SimilarityAlgorithm _cosineSimilarity;
  late final SimilarityAlgorithm _jaccardSimilarity;
  late final SimilarityAlgorithm _tfidfSimilarity;

  PlagiarismChecker(
      {TextProcessor? textProcessor, TextPreprocessor? textPreprocessor})
      : _textProcessor = textProcessor ?? SimpleTextProcessor(),
        _textPreprocessor = textPreprocessor ?? AdvancedTextPreprocessor() {
    _cosineSimilarity = CosineSimilarity(_textProcessor);
    _jaccardSimilarity = JaccardSimilarity(_textProcessor);
    _tfidfSimilarity = TfIdfSimilarity(_textPreprocessor);
  }

  PlagiarismResult checkPlagiarism(String text1, String text2,
      {Algorithm algorithm = Algorithm.average,
      double threshold = 0.7,
      bool caseSensitive = false,
      List<String>? customStopWords}) {
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
      case Algorithm.tfidf:
        similarityScore = _tfidfSimilarity.calculate(text1, text2);
        algorithmUsed = 'TF-IDF Similarity';
        break;
      case Algorithm.average:
      default:
        similarityScore = (_cosineSimilarity.calculate(text1, text2) +
                _jaccardSimilarity.calculate(text1, text2) +
                _tfidfSimilarity.calculate(text1, text2)) /
            3;
        algorithmUsed = 'Average Similarity';
        break;
    }

    bool isPlagiarized = similarityScore >= threshold;

    return PlagiarismResult(
      similarityScore: double.parse(similarityScore.toStringAsFixed(2)),
      algorithm: algorithmUsed,
      isPlagiarized: isPlagiarized,
    );
  }

  Map<String, double> getDetailedResults(String text1, String text2) {
    final cosineScore = double.parse(
        _cosineSimilarity.calculate(text1, text2).toStringAsFixed(2));
    final jaccardScore = double.parse(
        _jaccardSimilarity.calculate(text1, text2).toStringAsFixed(2));
    final tfidfScore = double.parse(
        _tfidfSimilarity.calculate(text1, text2).toStringAsFixed(2));
    final averageScore = double.parse(
        ((cosineScore + jaccardScore + tfidfScore) / 3).toStringAsFixed(2));

    return {
      'Cosine Similarity': cosineScore,
      'Jaccard Similarity': jaccardScore,
      'TF-IDF Similarity': tfidfScore,
      'Average Similarity': averageScore,
    };
  }
}
