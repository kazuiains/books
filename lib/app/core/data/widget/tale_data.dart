class TaleData {
  String? id;
  String? name;
  String? subtitle;
  String? image;
  String? route;
  String? url;

  ///view type on list items
  ///1: displays the icon in the trailing,
  ///2: displays the text in the trailing,
  ///3: don't display trailing
  int type;
  bool clickAble;

  TaleData({
    this.id,
    this.name,
    this.subtitle,
    this.image,
    this.route,
    this.url,
    this.type = 1,
    this.clickAble = true,
  });

  TaleData copyWith({
    String? id,
    String? name,
    String? subtitle,
    String? image,
    String? route,
    String? url,
    int? type,
    bool? clickAble,
  }) =>
      TaleData(
        id: id ?? this.id,
        name: name ?? this.name,
        subtitle: subtitle ?? this.subtitle,
        image: image ?? this.image,
        route: route ?? this.route,
        url: url ?? this.url,
        type: type ?? this.type,
        clickAble: clickAble ?? this.clickAble,
      );
}
