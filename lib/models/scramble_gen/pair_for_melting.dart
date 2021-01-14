import 'package:sortedmap/sortedmap.dart';

class PairForMelting {
  bool allComplete;
  var elementsNotOnPlace = SortedMap(Ordering.byKey());

  PairForMelting({this.allComplete, this.elementsNotOnPlace});
}