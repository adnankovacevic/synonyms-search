import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synonyms_search/core/extensions/focus_extension.dart';
import 'package:synonyms_search/core/notifiers/words_notifier.dart';
import 'package:synonyms_search/core/themes/app_colors.dart';

class AddWordView extends ConsumerWidget {
  AddWordView({super.key});

  final TextEditingController wordTextEditingController =
      TextEditingController();
  final TextEditingController synonymsTextEditinController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: Column(
            children: [
              TextField(
                controller: wordTextEditingController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Word',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: synonymsTextEditinController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Synonyms',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(
                      AppColors.backgroundColor,
                    ),
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.primaryColor)),
                onPressed: () {
                  final word = wordTextEditingController.text.trim();
                  final wordsList = synonymsTextEditinController.text
                      .split(',')
                      .map((e) => e.trim())
                      .toList();

                  if (word.isNotEmpty && wordsList.isNotEmpty) {
                    ref
                        .read(wordsNotifierProvider.notifier)
                        .addWord(word, wordsList);

                    wordTextEditingController.clear();
                    synonymsTextEditinController.clear();
                    context.unfocus();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('"$word" has been added successfully!'),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a word and synonyms.'),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text('Add Word'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
