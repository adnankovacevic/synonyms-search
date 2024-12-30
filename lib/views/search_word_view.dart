import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synonyms_search/core/themes/app_colors.dart';
import 'package:synonyms_search/core/themes/app_text_styles.dart';
import 'package:synonyms_search/core/utils/debouncer.dart';
import 'package:synonyms_search/core/notifiers/words_notifier.dart';
import 'package:synonyms_search/views/add_word_view.dart';

class SearchWordView extends ConsumerWidget {
  SearchWordView({super.key});

  final TextEditingController searchController = TextEditingController();
  final Debouncer debouncer = Debouncer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: SearchBar(
            controller: searchController,
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            side: const WidgetStatePropertyAll(BorderSide.none),
            elevation: const WidgetStatePropertyAll(0),
            hintText: "Search for a word",
            constraints: BoxConstraints.tight(
                const Size.fromHeight(kToolbarHeight - 10)),
            onChanged: (value) {
              debouncer(() {
                if (value.trim().isNotEmpty) {
                  ref
                      .read(wordsNotifierProvider.notifier)
                      .filterWords(value.trim());
                } else {
                  ref.read(wordsNotifierProvider.notifier).filterWords('');
                }
              });
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final synonyms = ref.watch(wordsNotifierProvider);

                if (synonyms.isEmpty) {
                  return Center(
                    child: searchController.text.isNotEmpty
                        ? Text(
                            "No result for '${searchController.text}' found.")
                        : const Text("No words available!"),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
                  child: ListView.builder(
                    itemCount: synonyms.length,
                    itemBuilder: (context, index) {
                      final word = synonyms.keys.elementAt(index);
                      final synonymList = synonyms[word]!.join(', ');

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          title: Text(word),
                          subtitle: RichText(
                            text: TextSpan(
                              text: 'is a synonym of ',
                              style: AppTextStyles.textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                  text: synonymList,
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add New Word"),
        icon: const Icon(Icons.add),
        tooltip: "Add new word",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddWordView(),
            ),
          );
        },
      ),
    );
  }
}
