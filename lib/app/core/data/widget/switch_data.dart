class SwitchData {
  String? id;
  String? name;
  String? subName;
  dynamic data;
  dynamic value;

  SwitchData({
    this.id,
    this.name,
    this.subName,
    this.data,
    this.value,
  });

  SwitchData copyWith({
    String? id,
    String? name,
    String? subName,
    dynamic data,
    dynamic value,
  }) =>
      SwitchData(
        id: id ?? this.id,
        name: name ?? this.name,
        subName: subName ?? this.subName,
        data: data ?? this.data,
        value: value ?? this.value,
      );
}
