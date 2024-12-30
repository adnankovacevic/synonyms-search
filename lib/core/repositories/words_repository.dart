class WordsRepository {
  final Map<String, Set<String>> _words = {};

  void addWord(String word, List<String> words) {
    if (!_words.containsKey(word)) {
      _words[word] = {};
    }

    for (final synonym in words) {
      addPair(word, synonym);
    }
  }

  Set<String> getWords(String word) {
    return _words[word] ?? {};
  }

  Map<String, Set<String>> get allSynonyms => Map.unmodifiable(_words);

  void addPair(String word1, String word2) {
    _words.putIfAbsent(word1, () => {}).add(word2);
    _words.putIfAbsent(word2, () => {}).add(word1);

    for (final transitiveWord in _words[word1]!) {
      if (transitiveWord != word2) {
        _words[transitiveWord]!.add(word2);
        _words[word2]!.add(transitiveWord);
      }
    }
  }
}
