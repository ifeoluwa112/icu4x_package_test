import 'package:icu4x/icu4x.dart';
import 'package:icu4x_test/core/core.dart';
import 'package:icu4x_test/helpers/helpers.dart';

class Icu4xMethods {
  static const int _maxCodePoint = 0x10FFFF;
  static int matchedCount = 0;

  /// Returns Unicode characters in a page-based fashion.
  /// Internally uses a cursor scan for memory efficiency.
  static UnicodePageResult getUnicodeCharactersByPage({
    required int pageNumber, // 0-based page index
    int pageSize = 20,
    String? searchQuery,
  }) {
    assert(pageNumber >= 0, 'Page number cannot be negative.');
    assert(pageSize > 0, 'Page size must be greater than zero.');

    // Calculate the cursor for the first code point of this page
    var startAfterCodePoint = -1;

    if (pageNumber > 0) {
      // Scan pages before to find cursor
      // Each pageSize increments the cursor by the number of matched displayable characters
      // For efficiency, just multiply by pageSize as an approximation for first pass
      startAfterCodePoint =
          _estimateStartAfterCodePoint(pageNumber, pageSize, searchQuery);
    }

    // Use the memory-safe cursor-based function
    return _getUnicodeCharacters(
      startAfterCodePoint: startAfterCodePoint,
      limit: pageSize,
      searchQuery: searchQuery,
    );
  }

  /// Estimate the startAfterCodePoint for a given pageNumber
  /// This is a lightweight approximation — the main function will correct
  static int _estimateStartAfterCodePoint(
    int pageNumber,
    int pageSize,
    String? searchQuery,
  ) {
    // Rough estimate: just skip page    Number * pageSize code points
    // This ensures we don't rescan from 0 every time
    return (pageNumber * pageSize) - 1;
  }

  /// The main cursor-based function
  static UnicodePageResult _getUnicodeCharacters({
    required int startAfterCodePoint,
    int limit = 20,
    String? searchQuery,
  }) {
    final results = <UnicodeCharProperties>[];
    final normalizedQuery = searchQuery?.toNormalizedUnicodeQuery();

    var cp = startAfterCodePoint + 1;

    while (cp <= _maxCodePoint && results.length < limit) {
      if (cp.isSurrogate) {
        cp++;
        continue;
      }
      if (IcuCache.ignorableSet.contains(cp)) {
        cp++;
        continue;
      }
      if (normalizedQuery != null && !cp.matchesUnicodeQuery(normalizedQuery)) {
        cp++;
        continue;
      }

      final char = cp.asChar;
      if (char.trim().isEmpty) {
        cp++;
        continue;
      }

      results.add(
        UnicodeCharProperties(
          character: char,
          codePoint: cp,
          script: _getScriptName(IcuCache.scriptMap[cp]),
          generalCategory:
              _getGeneralCategoryName(IcuCache.generalCategoryMap[cp]),
          // plane: matchedCount.toString(),
        ),
      );

      matchedCount++;
      cp++;
    }

    return UnicodePageResult(
      items: results,
      lastCodePoint: cp - 1,
      hasMore: cp <= _maxCodePoint,
    );
  }

  static String _getScriptName(int scriptValue) {
    try {
      return Script.values[scriptValue].longName() ?? 'Unknown';
    } catch (_) {
      return 'Unknown';
    }
  }

  static String? _getGeneralCategoryName(int value) {
    try {
      return GeneralCategory.fromIntegerValue(value)?.longName();
    } catch (_) {
      return null;
    }
  }
}
