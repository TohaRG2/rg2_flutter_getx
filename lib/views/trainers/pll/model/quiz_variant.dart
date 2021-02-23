class QuizVariant {
  /// номер варианта ответа
  int id;
  /// Выводимое пользователю значение
  String value;
  /// Может ли данный вариант быть выбран в качестве загаданного(true) или только в качестве возможного ответа(false)
  bool isSelectable = true;
  /// Является ли он загаданным
  bool isCorrectAnswer = false;

  QuizVariant(this.id, this.value, this.isSelectable);

  @override
  String toString() => "$id, isSel = $isSelectable, isCorrect = $isCorrectAnswer, value = $value\n";

}