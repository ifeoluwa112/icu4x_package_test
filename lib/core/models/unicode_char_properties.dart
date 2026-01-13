import 'package:equatable/equatable.dart';

class UnicodeCharProperties extends Equatable {
  const UnicodeCharProperties({
    required this.character,
    required this.codePoint,
    this.name,
    this.unicodeValue,
    this.generalCategory,
    this.block,
    this.plane,
    this.script,
    this.bidiClass,
    this.eastAsianWidth,
    this.lineBreak,
    this.wordBreak,
    this.sentenceBreak,
    this.graphemeClusterBreak,
    this.hangulSyllableType,
    this.joiningType,
    this.isAlphabetic,
    this.isUppercase,
    this.isLowercase,
    this.isWhiteSpace,
    this.isMath,
    this.isDash,
    this.isDiacritic,
    this.isEmoji,
    this.isEmojiPresentation,
    this.isEmojiModifier,
    this.isEmojiModifierBase,
  });

  final String character;
  final int codePoint;
  final String? name;
  final String? unicodeValue;
  final String? generalCategory;
  final String? block;
  final String? plane;
  final String? script;
  final String? bidiClass;
  final String? eastAsianWidth;
  final String? lineBreak;
  final String? wordBreak;
  final String? sentenceBreak;
  final String? graphemeClusterBreak;
  final String? hangulSyllableType;
  final String? joiningType;
  final bool? isAlphabetic;
  final bool? isUppercase;
  final bool? isLowercase;
  final bool? isWhiteSpace;
  final bool? isMath;
  final bool? isDash;
  final bool? isDiacritic;
  final bool? isEmoji;
  final bool? isEmojiPresentation;
  final bool? isEmojiModifier;
  final bool? isEmojiModifierBase;

  UnicodeCharProperties copyWith({
    String? character,
    int? codePoint,
    String? name,
    String? unicodeValue,
    String? generalCategory,
    String? block,
    String? plane,
    String? script,
    String? bidiClass,
    String? eastAsianWidth,
    String? lineBreak,
    String? wordBreak,
    String? sentenceBreak,
    String? graphemeClusterBreak,
    String? hangulSyllableType,
    String? joiningType,
    bool? isAlphabetic,
    bool? isUppercase,
    bool? isLowercase,
    bool? isWhiteSpace,
    bool? isMath,
    bool? isDash,
    bool? isDiacritic,
    bool? isEmoji,
    bool? isEmojiPresentation,
    bool? isEmojiModifier,
    bool? isEmojiModifierBase,
  }) {
    return UnicodeCharProperties(
      character: character ?? this.character,
      codePoint: codePoint ?? this.codePoint,
      name: name ?? this.name,
      unicodeValue: unicodeValue ?? this.unicodeValue,
      generalCategory: generalCategory ?? this.generalCategory,
      block: block ?? this.block,
      plane: plane ?? this.plane,
      script: script ?? this.script,
      bidiClass: bidiClass ?? this.bidiClass,
      eastAsianWidth: eastAsianWidth ?? this.eastAsianWidth,
      lineBreak: lineBreak ?? this.lineBreak,
      wordBreak: wordBreak ?? this.wordBreak,
      sentenceBreak: sentenceBreak ?? this.sentenceBreak,
      graphemeClusterBreak: graphemeClusterBreak ?? this.graphemeClusterBreak,
      hangulSyllableType: hangulSyllableType ?? this.hangulSyllableType,
      joiningType: joiningType ?? this.joiningType,
      isAlphabetic: isAlphabetic ?? this.isAlphabetic,
      isUppercase: isUppercase ?? this.isUppercase,
      isLowercase: isLowercase ?? this.isLowercase,
      isWhiteSpace: isWhiteSpace ?? this.isWhiteSpace,
      isMath: isMath ?? this.isMath,
      isDash: isDash ?? this.isDash,
      isDiacritic: isDiacritic ?? this.isDiacritic,
      isEmoji: isEmoji ?? this.isEmoji,
      isEmojiPresentation: isEmojiPresentation ?? this.isEmojiPresentation,
      isEmojiModifier: isEmojiModifier ?? this.isEmojiModifier,
      isEmojiModifierBase: isEmojiModifierBase ?? this.isEmojiModifierBase,
    );
  }

  @override
  List<Object?> get props => [
        character,
        codePoint,
        name,
        unicodeValue,
        generalCategory,
        block,
        plane,
        script,
        bidiClass,
        eastAsianWidth,
        lineBreak,
        wordBreak,
        sentenceBreak,
        graphemeClusterBreak,
        hangulSyllableType,
        joiningType,
        isAlphabetic,
        isUppercase,
        isLowercase,
        isWhiteSpace,
        isMath,
        isDash,
        isDiacritic,
        isEmoji,
        isEmojiPresentation,
        isEmojiModifier,
        isEmojiModifierBase,
      ];
}
