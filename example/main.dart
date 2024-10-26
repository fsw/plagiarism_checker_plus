// example/example.dart

import 'package:plagiarism_checker_plus/plagiarism_checker_plus.dart';

void main() {
  final checker = PlagiarismCheckerPlus();

  const text1 = "This is a sample text for plagiarism detection.";
  const text2 = "This text is an example for detecting plagiarism.";

  // Use default settings (average algorithm and 0.7 threshold)
  final similarityResult = checker.check(text1, text2);
  print('Default Similarity Score: ${similarityResult.score}');
  print('Algorithm Used: ${similarityResult.algorithm}');
  print('Is Plagiarized: ${similarityResult.isPlagiarized}');

  // Use Cosine Similarity only
  final cosineSimilarityResult =
      checker.check(text1, text2, algorithm: Algorithm.cosine);
  print('Cosine Similarity Score: ${cosineSimilarityResult.score}');
  print('Algorithm Used: ${cosineSimilarityResult.algorithm}');
  print('Is Plagiarized: ${cosineSimilarityResult.isPlagiarized}');

  // Use Jaccard Similarity only
  final jaccardSimilarityResult =
      checker.check(text1, text2, algorithm: Algorithm.jaccard);
  print('Jaccard Similarity Score: ${jaccardSimilarityResult.score}');
  print('Algorithm Used: ${jaccardSimilarityResult.algorithm}');
  print('Is Plagiarized: ${jaccardSimilarityResult.isPlagiarized}');

  // Get detailed similarity scores
  final detailedResults = checker.getDetailedResults(text1, text2);
  print('Detailed Results:');
  detailedResults.forEach((algorithm, score) {
    print('$algorithm: ${score.toStringAsFixed(2)}');
  });
}
