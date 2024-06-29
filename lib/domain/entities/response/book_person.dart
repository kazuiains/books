class BookPerson {
  String? name;
  num? birthYear;
  num? deathYear;

  BookPerson({
    this.name,
    this.birthYear,
    this.deathYear,
  });

  BookPerson copyWith({
    String? name,
    num? birthYear,
    num? deathYear,
  }) =>
      BookPerson(
        name: name ?? this.name,
        birthYear: birthYear ?? this.birthYear,
        deathYear: deathYear ?? this.deathYear,
      );
}
