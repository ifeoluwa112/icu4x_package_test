import 'package:icu4x/icu4x.dart';

class IcuCache {
  static final scriptMap = CodePointMapData16.script();
  static final generalCategoryMap = CodePointMapData8.generalCategory();
  static final ignorableSet = CodePointSetData.defaultIgnorableCodePoint();
}
