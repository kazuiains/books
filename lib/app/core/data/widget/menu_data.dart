class MenuData {
  String? id;
  String? name;
  String? subtitle;
  dynamic data;
  dynamic controller;
  dynamic valueBox;

  MenuData({
    this.id,
    this.name,
    this.subtitle,
    this.data,
    this.controller,
    this.valueBox,
  });

  MenuData copyWith({
    String? id,
    String? name,
    String? subtitle,
    dynamic data,
    dynamic controller,
    dynamic valueBox,
  }) =>
      MenuData(
        id: id ?? this.id,
        name: name ?? this.name,
        subtitle: subtitle ?? this.subtitle,
        data: data ?? this.data,
        controller: controller ?? this.controller,
        valueBox: valueBox ?? this.valueBox,
      );
}
