
class FavItem {
  final int id;
  final String phase;
  final int subId;

  const FavItem({required this.id, required this.phase, required this.subId});

  Map<String, dynamic> toMap() => {
    'id': id,
    'phase': phase,
    'subId' : subId,
  };

  factory FavItem.fromMap(Map<String, dynamic> map) =>
      FavItem(id: map['id'] as int, phase: map['phase'] as String, subId: map['subId'] as int);

  @override
  toString() => "id: $id, phase: $phase, subId: $subId";
}
