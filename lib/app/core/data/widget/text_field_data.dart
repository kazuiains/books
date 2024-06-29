

class TextFieldData {
  String? id;
  String? text;
  dynamic data;
  dynamic controller;

  TextFieldData({
    this.id,
    this.text,
    this.data,
    this.controller,
  });

  TextFieldData copyWith({
    String? id,
    String? text,
    dynamic data,
    dynamic controller,
  }) =>
      TextFieldData(
        id: id ?? this.id,
        text: text ?? this.text,
        data: data ?? this.data,
        controller: controller ?? this.controller,
      );
}
