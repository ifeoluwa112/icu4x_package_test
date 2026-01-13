extension UnicodeQueryX on String {
  String? toNormalizedUnicodeQuery() {
    final trimmed = trim();
    if (trimmed.isEmpty) return null;

    final upper = trimmed.toUpperCase();
    return upper.startsWith('U+') ? upper : 'U+$upper';
  }
}

extension CodePointX on int {
  bool get isSurrogate => this >= 0xD800 && this <= 0xDFFF;

  String get unicodeLabel =>
      'U+${toRadixString(16).padLeft(4, '0').toUpperCase()}';

  bool matchesUnicodeQuery(String query) {
    return unicodeLabel.contains(query);
  }

  String get asChar => String.fromCharCode(this);
}
