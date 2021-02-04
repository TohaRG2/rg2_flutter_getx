
class ScrambleDecisionCondition {
  String scramble = "";
  String decision;
  bool isEdgeMelted;
  bool isCornerMelted;

  String get decisionInfo {
    var decisionLen = decision.trim().split(" ").length;
    var decisionInfo = "Длина = $decisionLen, углы = $isCornerMelted, ребра = $isEdgeMelted";
    return decisionInfo;
  }

  ScrambleDecisionCondition({this.scramble = "", this.decision, this.isEdgeMelted, this.isCornerMelted});

  @override
  String toString() {
    return "Проверка Scramble $scramble, Переплавка буфера ребер - $isEdgeMelted , Переплавка буфера углов - $isCornerMelted, Решение - $decision (${decision.trim().split(" ").length})";
  }

}