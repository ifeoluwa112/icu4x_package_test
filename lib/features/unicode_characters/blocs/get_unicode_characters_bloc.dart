import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icu4x_test/core/core.dart';
import 'package:rxdart/rxdart.dart';

part 'get_unicode_characters_bloc.freezed.dart';
part 'get_unicode_characters_event.dart';
part 'get_unicode_characters_state.dart';

EventTransformer<Event> debounceTransformer<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

class GetUnicodeCharactersBloc
    extends Bloc<GetUnicodeCharactersEvent, GetUnicodeCharactersState> {
  GetUnicodeCharactersBloc() : super(const _Initial()) {
    on<_GetCharacters>(
      _onGetCharacters,
      transformer: debounceTransformer(const Duration(milliseconds: 500)),
    );
  }

  Future<void> _onGetCharacters(
    _GetCharacters event,
    Emitter<GetUnicodeCharactersState> emit,
  ) async {
    try {
      // Emit loading state while preserving existing characters
      emit(
        _Loading(
          characters: state.characters,
          pageNo: state.pageNo,
          showLoadMore: state.showLoadMore,
        ),
      );

      // Fetch characters from the Unicode database
      final charProperties = Icu4xMethods.getUnicodeCharactersByPage(
        pageNumber: event.page,
        searchQuery: event.searchQuery,
      );

      // Emit loaded state with appropriate character list
      emit(
        _Loaded(
          characters: event.page == 1
              ? charProperties.items // Fresh search: replace all characters
              : [
                  ...state.characters, // Pagination: append new characters
                  ...charProperties.items,
                ],
          pageNo: event.page,
          showLoadMore: charProperties.hasMore,
        ),
      );
    } on Exception catch (e) {
      // Emit error state while preserving existing characters
      emit(
        _Error(
          characters: state.characters,
          pageNo: state.pageNo,
          showLoadMore: state.showLoadMore,
          error: e.toString(),
        ),
      );
    }
  }
}
