class PairForMelting {
  final bool allComplete;
  final List<int> elementsNotOnPlace;

  const PairForMelting({required this.allComplete, required this.elementsNotOnPlace});

  @override
  String toString() {
    return "(Complete? = $allComplete, elements - [$elementsNotOnPlace)]";
  }
}
