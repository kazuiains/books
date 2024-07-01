mixin QueryHelper {
  String? whereStr(Map<String, dynamic>? data) {
    return data?.keys.map((key) => "$key = ?").join(' AND ');
  }

  String? likeStr(Map<String, dynamic>? data) {
    return data?.keys.map((key) => "$key LIKE ?").join(' AND ');
  }

  String whereStrIn(int length, String column) {
    return "$column IN (${('?' * (length)).split('').join(', ')})";
  }

  List<String>? argsValue(Map<String, dynamic>? data) {
    List<String> result = [];
    data?.forEach((key, value) {
      if (value != null) {
        result.add("$value");
      }
    });
    return data != null ? result : null;
  }

  Map<String, List<dynamic>> listToMap(List<Map<String, dynamic>> list) {
    Map<String, List<String>> resultMap = {};

    // Initialize the resultMap with empty lists for each key in the first map
    for (var key in list.first.keys) {
      resultMap[key] = [];
    }

    // Iterate over the list and populate the resultMap
    for (var map in list) {
      map.forEach((key, value) {
        resultMap[key]?.add(value);
      });
    }

    return resultMap;
  }
}
