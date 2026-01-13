part of 'get_unicode_characters_bloc.dart';

@freezed
class GetUnicodeCharactersState with _$GetUnicodeCharactersState {
  const factory GetUnicodeCharactersState.initial({
    @Default(<UnicodeCharProperties>[]) List<UnicodeCharProperties> characters,
    @Default(1) int pageNo,
    @Default(false) bool showLoadMore,
  }) = _Initial;

  const factory GetUnicodeCharactersState.loading({
    required List<UnicodeCharProperties> characters,
    required int pageNo,
    @Default(false) bool showLoadMore,
  }) = _Loading;

  const factory GetUnicodeCharactersState.loaded({
    required List<UnicodeCharProperties> characters,
    required int pageNo,
    @Default(false) bool showLoadMore,
  }) = _Loaded;

  const factory GetUnicodeCharactersState.error({
    required List<UnicodeCharProperties> characters,
    required int pageNo,
    @Default(false) bool showLoadMore,
    String? error,
  }) = _Error;
}
