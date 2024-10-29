import 'package:flutter_test/flutter_test.dart';
import 'package:plagiarism_checker_plus/src/algorithms/cosine_similarity.dart';
import 'package:plagiarism_checker_plus/src/text_processing/simple_text_processor.dart';

void main() {
  final textProcessor = SimpleTextProcessor();
  final cosineSimilarity = CosineSimilarity(textProcessor);

  test('calculate should return correct cosine similarity', () {
    const text1 = 'Hello world';
    const text2 = 'Hello';

    final result = cosineSimilarity.calculate(text1, text2);

    expect(result, greaterThan(0.0));
  });
}
