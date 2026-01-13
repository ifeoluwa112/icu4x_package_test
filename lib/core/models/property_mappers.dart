// Class to hold the complex, pre-loaded ICU4X data maps.
import 'package:equatable/equatable.dart';
import 'package:icu4x/icu4x.dart';

class PropertyMappers extends Equatable {
  const PropertyMappers({
    required this.gcMap,
    required this.scriptMap,
    required this.blockMap,
  });

  final CodePointMapData8 gcMap;
  final CodePointMapData16 scriptMap;
  final CodePointMapData8 blockMap;

  @override
  List<Object?> get props => [gcMap, scriptMap, blockMap];
}
