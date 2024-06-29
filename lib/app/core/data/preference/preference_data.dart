class PreferenceData {
  String? translatorId;
  String? translatorName;
  String? language;
  String? country;
  bool? selected;
  dynamic dynamicValue;

  PreferenceData({
    this.translatorId,
    this.translatorName,
    this.language,
    this.country,
    this.selected,
    this.dynamicValue,
  });

  PreferenceData copyWith({
    String? translatorId,
    String? translatorName,
    String? language,
    String? country,
    bool? selected,
    dynamic dynamicValue,
  }) =>
      PreferenceData(
        translatorId: translatorId ?? this.translatorId,
        translatorName: translatorName ?? this.translatorName,
        language: language ?? this.language,
        country: country ?? this.language,
        selected: selected ?? this.selected,
        dynamicValue: dynamicValue ?? this.dynamicValue,
      );
}
