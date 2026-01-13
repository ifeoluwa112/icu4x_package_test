import 'package:icu4x_test/core/core.dart';

class UnicodePageResult {
  UnicodePageResult({
    required this.items,
    required this.lastCodePoint,
    required this.hasMore,
  });
  final List<UnicodeCharProperties> items;
  final int lastCodePoint;
  final bool hasMore;
}
