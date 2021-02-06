class PairForMelting {
  bool allComplete;
  List<int> elementsNotOnPlace;

  PairForMelting({this.allComplete, this.elementsNotOnPlace});

  @override
  String toString() {
    return "(Complete? = $allComplete, elements - [$elementsNotOnPlace)]";
  }
}