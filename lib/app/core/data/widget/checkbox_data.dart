class CheckboxData {
  String? id;
  String? name;
  String? subName;
  dynamic data;
  bool? tristate;
  bool? value;

  CheckboxData({
    this.id,
    this.name,
    this.subName,
    this.data,
    this.tristate = false,
    this.value,
  });

  CheckboxData copyWith({
    String? id,
    String? name,
    String? subName,
    dynamic data,
    bool? tristate,
    bool? value,
  }) =>
      CheckboxData(
        id: id ?? this.id,
        name: name ?? this.name,
        subName: subName ?? this.subName,
        data: data ?? this.data,
        tristate: tristate ?? this.tristate,
        value: value ?? this.value,
      );
}
