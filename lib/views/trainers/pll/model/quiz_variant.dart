class QuizVariant {
  /// номер варианта ответа
  int id;
  /// Выводимое пользователю значение
  String value;
  /// Может ли данный вариант быть выбран в качестве загаданного
  bool isSelectable = true;
  /// Является ли он загаданным
  bool isCorrectAnswer = false;

  QuizVariant(this.id, this.value, this.isSelectable);

  @override
  String toString() => "$id, value = $value, "
      "isSel = $isSelectable, isCorrect = $isCorrectAnswer\n";

}