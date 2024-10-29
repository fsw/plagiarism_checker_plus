import '../text_processing/text_preprocessor.dart';
import 'similarity_algorithm.dart';
import 'dart:math';

class TfIdfSimilarity implements SimilarityAlgorithm {
  final TextPreprocessor _textPreprocessor;

  TfIdfSimilarity(this._textPreprocessor);

  @override
  double calculate(String text1, String text2) {
    final processedText1 = _textPreprocessor.preprocess(text1);
    final processedText2 = _textPreprocessor.preprocess(text2);

    final words1 = processedText1.split(' ');
    final words2 = processedText2.split(' ');

    final allWords = {...words1, ...words2};
    final tf1 = _termFrequency(words1, allWords);
    final tf2 = _termFrequency(words2, allWords);

    final idf = _inverseDocumentFrequency([words1, words2], allWords);

    final tfidf1 = _tfidf(tf1, idf);
    final tfidf2 = _tfidf(tf2, idf);

    return _cosineSimilarity(tfidf1, tfidf2);
  }

  Map<String, double> _termFrequency(List<String> words, Set<String> allWords) {
    final frequency = <String, double>{};
    for (var word in allWords) {
      frequency[word] = words.where((w) => w == word).length / words.length;
    }
    return frequency;
  }

  Map<String, double> _inverseDocumentFrequency(
      List<List<String>> documents, Set<String> allWords) {
    final idf = <String, double>{};
    for (var word in allWords) {
      final docCount = documents.where((doc) => doc.contains(word)).length;
      idf[word] = log(documents.length / (1 + docCount));
    }
    return idf;
  }

  Map<String, double> _tfidf(Map<String, double> tf, Map<String, double> idf) {
    final tfidf = <String, double>{};
    tf.forEach((word, tfValue) {
      tfidf[word] = tfValue * idf[word]!;
    });
    return tfidf;
  }

  double _cosineSimilarity(
      Map<String, double> tfidf1, Map<String, double> tfidf2) {
    final dotProduct = tfidf1.keys.fold<double>(0, (sum, word) {
      return sum + (tfidf1[word]! * tfidf2[word]!);
    });

    final magnitude1 =
        sqrt(tfidf1.values.fold(0, (sum, value) => sum + pow(value, 2)));
    final magnitude2 =
        sqrt(tfidf2.values.fold(0, (sum, value) => sum + pow(value, 2)));

    if (magnitude1 == 0 || magnitude2 == 0) {
      return 0.0;
    }
    return dotProduct / (magnitude1 * magnitude2);
  }
}
