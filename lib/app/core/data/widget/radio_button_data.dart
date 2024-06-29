class RadioButtonData {
  String? id;
  String? name;
  String? subName;
  dynamic data;
  dynamic value;

  RadioButtonData({
    this.id,
    this.name,
    this.subName,
    this.data,
    this.value,
  });

  RadioButtonData copyWith({
    String? id,
    String? name,
    String? subName,
    dynamic data,
    dynamic value,
  }) =>
      RadioButtonData(
        id: id ?? this.id,
        name: name ?? this.name,
        subName: subName ?? this.subName,
        data: data ?? this.data,
        value: value ?? this.value,
      );
}
