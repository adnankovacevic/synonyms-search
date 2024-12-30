import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synonyms_search/core/extensions/focus_extension.dart';
import 'package:synonyms_search/core/themes/app_themes.dart';
import 'package:synonyms_search/views/search_word_view.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unfocus();
      },
      child: MaterialApp(
        title: 'Synonyms Search Tool',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: SearchWordView(),
      ),
    );
  }
}
