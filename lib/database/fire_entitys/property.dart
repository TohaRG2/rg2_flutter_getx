
class Property {
  final String key;
  final dynamic value;
  final DateTime changeDate;

  Property({required this.key, required this.value, DateTime? changeDate})
      : changeDate = changeDate ?? DateTime.now();

  Map<String, dynamic> toMap() => {
        'key': key,
        'value': value,
        'changeDate': changeDate,
      };

  factory Property.fromMap(Map<String, dynamic> map) {
    final dynamic ch = map['changeDate'];
    DateTime? dt;
    try {
      dt = ch?.toDate();
    } catch (_) {
      dt = ch is DateTime ? ch : null;
    }
    return Property(
      key: map['key'],
      value: map['value'],
      changeDate: dt,
    );
  }

  @override
  toString() => "key: $key, value: $value, chDate: $changeDate";
}
