import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synonyms_search/core/repositories/words_repository.dart';

final wordsRepositoryProvider = Provider((ref) => WordsRepository());

final wordsNotifierProvider =
    StateNotifierProvider<SynonymsNotifier, Map<String, Set<String>>>(
        (ref) => SynonymsNotifier(ref.read(wordsRepositoryProvider)));

class SynonymsNotifier extends StateNotifier<Map<String, Set<String>>> {
  SynonymsNotifier(this.repository) : super({});

  final WordsRepository repository;

  void addWord(String word, List<String> synonyms) {
    repository.addWord(word, synonyms);
    updateState();
  }

  Set<String> getWords(String word) {
    return repository.getWords(word);
  }

  void filterWords(String query) {
    if (query.isEmpty) {
      updateState();
      return;
    }

    final filteredWords = Map<String, Set<String>>.fromEntries(
      state.entries.where(
        (entry) => entry.key.toLowerCase().contains(query.toLowerCase()),
      ),
    );

    state = filteredWords;
  }

  void updateState() {
    state = Map.from(repository.allSynonyms);
  }
}
