import '../text_processing/text_processor.dart';
import 'similarity_algorithm.dart';

class JaccardSimilarity implements SimilarityAlgorithm {
  final TextProcessor _textProcessor;

  JaccardSimilarity(this._textProcessor);

  @override
  double calculate(String text1, String text2) {
    final frequency1 = _textProcessor.processText(text1);
    final frequency2 = _textProcessor.processText(text2);

    final allWords = {...frequency1.keys, ...frequency2.keys};
    final intersection = allWords
        .where((word) =>
            frequency1.containsKey(word) && frequency2.containsKey(word))
        .length;
    final union = allWords.length;

    if (union == 0) {
      return 0.0;
    }
    return intersection / union;
  }
}
