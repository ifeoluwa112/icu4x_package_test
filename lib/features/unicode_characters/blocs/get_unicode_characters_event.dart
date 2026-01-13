part of 'get_unicode_characters_bloc.dart';

@freezed
class GetUnicodeCharactersEvent with _$GetUnicodeCharactersEvent {
  const factory GetUnicodeCharactersEvent.getCharacters({
    required int page,
    String? searchQuery,
  }) = _GetCharacters;
}
