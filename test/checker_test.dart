import 'package:flutter_test/flutter_test.dart';
import 'package:plagiarism_checker_plus/src/checker.dart';
import 'package:plagiarism_checker_plus/src/text_processing/simple_text_processor.dart';

void main() {
  final checker = PlagiarismChecker(textProcessor: SimpleTextProcessor());

  test('checkPlagiarism should return correct result', () {
    const text1 = 'Hello world';
    const text2 = 'Hello';

    final result = checker.checkPlagiarism(text1, text2);

    expect(result.similarityScore, greaterThan(0.0));
    expect(result.algorithm, 'Average Similarity');
    expect(result.isPlagiarized, isFalse);
  });
}
