import 'package:flutter_test/flutter_test.dart';
import 'package:plagiarism_checker_plus/plagiarism_checker_plus.dart';

void main() {
  final checker = PlagiarismCheckerPlus();

  test('Default algorithm (average) returns similarity score', () {
    const text1 = "This is a sample text for testing similarity.";
    const text2 = "This text is a sample used for similarity testing.";
    final similarity = checker.check(text1, text2);
    expect(similarity.score, greaterThan(0.5));
  });

  test('Cosine Similarity only', () {
    const text1 = "A unique sentence here.";
    const text2 = "A unique sentence for testing here.";
    final similarity = checker.check(text1, text2, algorithm: Algorithm.cosine);
    expect(similarity.score, greaterThan(0.3));
  });

  test('Jaccard Similarity only', () {
    const text1 = "A unique sentence for testing here.";
    const text2 = "A unique sentence for testing here.";
    final similarity =
        checker.check(text1, text2, algorithm: Algorithm.jaccard);
    expect(similarity.score, greaterThan(0.9));
  });
}
