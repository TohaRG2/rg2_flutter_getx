
class ScrambleDecisionCondition {
  final String scramble;
  final String decision;
  final bool isEdgeMelted;
  final bool isCornerMelted;

  String get decisionInfo {
    var decisionLen = decision.trim().split(" ").length;
    var decisionInfo = "Длина = $decisionLen, углы = $isCornerMelted, ребра = $isEdgeMelted";
    return decisionInfo;
  }

  const ScrambleDecisionCondition({
    this.scramble = "",
    required this.decision,
    required this.isEdgeMelted,
    required this.isCornerMelted,
  });

  @override
  String toString() {
    return "Проверка Scramble $scramble, Переплавка буфера ребер - $isEdgeMelted , Переплавка буфера углов - $isCornerMelted, Решение - $decision (${decision.trim().split(" ").length})";
  }

}
