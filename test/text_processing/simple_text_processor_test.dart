import 'package:flutter_test/flutter_test.dart';
import 'package:plagiarism_checker_plus/src/text_processing/simple_text_processor.dart';

void main() {
  final textProcessor = SimpleTextProcessor();

  test('processText should return correct word frequency', () {
    const text = 'Hello world! Hello!';
    final result = textProcessor.processText(text);

    expect(result['hello'], 2);
    expect(result['world'], 1);
  });
}
