class DynamicHelper {
  static num? toNum(dynamic value) {
    if (value != null && value is String) {
      return num.parse(value);
    }
    return value;
  }
}
