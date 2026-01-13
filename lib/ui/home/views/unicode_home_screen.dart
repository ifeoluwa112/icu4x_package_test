import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:icu4x_test/features/features.dart';
import 'package:icu4x_test/helpers/helpers.dart';
import 'package:icu4x_test/ui/ui.dart';

class UnicodeHomeScreen extends HookWidget {
  const UnicodeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final characterState = context.watch<GetUnicodeCharactersBloc>().state;
    final query = useState<String>('');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ICU4X UnicodeCharacters'),
        centerTitle: true,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (characterState.showLoadMore &&
              notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent) {
            context.read<GetUnicodeCharactersBloc>().add(
                  GetUnicodeCharactersEvent.getCharacters(
                    page: characterState.pageNo + 1,
                  ),
                );
          }
          return true;
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SearchField(
                onChanged: (value) {
                  query.value = value;
                  if (value.isNotEmpty) {
                    context.read<GetUnicodeCharactersBloc>().add(
                          GetUnicodeCharactersEvent.getCharacters(
                            searchQuery: value,
                            page: 1,
                          ),
                        );
                  } else {
                    context.read<GetUnicodeCharactersBloc>().add(
                          const GetUnicodeCharactersEvent.getCharacters(
                            page: 1,
                          ),
                        );
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: characterState.characters.length,
                itemBuilder: (context, index) {
                  final character = characterState.characters[index];
                  final codePoint = character.codePoint.unicodeLabel;
                  return UnicodeTile(
                    onTap: () {
                      log(
                        'Character: ${character.character}, CodePoint: $codePoint, Script: ${character.script}, General Category: ${character.generalCategory}',
                      );
                    },
                    script: character.script ?? 'Unknown',
                    character: character.character,
                    codePoint: codePoint,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
