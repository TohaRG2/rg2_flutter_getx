import 'package:rg2/database/entitys/main_db_item.dart';

class CommentItem {
  final int id;
  final String phase;
  final String comment;

  const CommentItem({required this.id, required this.phase, required this.comment});

  Map<String, dynamic> toMap() => {
    'id': id,
    'phase': phase,
    'comment' : comment,
  };

  factory CommentItem.fromMap(Map<String, dynamic> map) =>
      CommentItem(id: map['id'] as int, phase: map['phase'] as String, comment: map['comment'] as String);

  factory CommentItem.fromMainDbItem(MainDBItem item) =>
      CommentItem(id: item.id, phase: item.phase, comment: item.comment);


  @override
  toString() => "id: $id, phase: $phase, comment: $comment";
}
