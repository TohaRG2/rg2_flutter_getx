
class ScrambleDecisionCondition {
  String scramble = "";
  String decision;
  bool isEdgeMelted;
  bool isCornerMelted;

  String get decisionLength {
    return decision.trim().split(" ").length.toString();
  }

  ScrambleDecisionCondition({this.scramble, this.decision, this.isEdgeMelted, this.isCornerMelted});

  @override
  String toString() {
    return "Проверка Scramble $scramble, Переплавка буфера ребер - $isEdgeMelted , Переплавка буфера углов - $isCornerMelted, Решение - $decision";
  }

}