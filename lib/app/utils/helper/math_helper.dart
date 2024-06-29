class MathHelper {
  static percentage({
    int? actual,
    int? target,
    double? percentageComa,
  }) {
    int result = 0;
    if (actual != null && target != null && (actual != 0 || target != 0)) {
      double value = (actual / target) * 100;
      result = !value.isNaN && !value.isInfinite ? value.toInt() : 0;
    }
    if (percentageComa != null &&
        (percentageComa != 0 || percentageComa != 0.0)) {
      double value = percentageComa * 100;
      result = !value.isNaN && !value.isInfinite ? value.toInt() : 0;
    }
    return result;
  }

  static removeComma(double? value) {
    int result = 0;
    if (value != null && value != 0 && value != 0.0) {
      result = !value.isNaN && !value.isInfinite ? value.toInt() : 0;
    }
    return result;
  }

  static age({
    String? birthDateString,
  }) {
    String result = "";
    if (birthDateString != null && birthDateString.isNotEmpty) {
      var birthDate = DateTime.parse(birthDateString);
      var currentDate = DateTime.now();
      result = (currentDate.year - birthDate.year).toString();
    }
    return result;
  }
}
