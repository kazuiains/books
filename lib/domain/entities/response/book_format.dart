class BookFormat {
  String? textHtml;
  String? applicationEpubZip;
  String? applicationXMobiPocketEbook;
  String? applicationRdfXml;
  String? imageJpeg;
  String? textPlainCharsetUsaSCII;
  String? applicationOCTETStream;

  BookFormat({
    this.textHtml,
    this.applicationEpubZip,
    this.applicationXMobiPocketEbook,
    this.applicationRdfXml,
    this.imageJpeg,
    this.textPlainCharsetUsaSCII,
    this.applicationOCTETStream,
  });

  BookFormat copyWith({
    String? textHtml,
    String? applicationEpubZip,
    String? applicationXMobiPocketEbook,
    String? applicationRdfXml,
    String? imageJpeg,
    String? textPlainCharsetUsaSCII,
    String? applicationOCTETStream,
  }) =>
      BookFormat(
        textHtml: textHtml ?? this.textHtml,
        applicationEpubZip: applicationEpubZip ?? this.applicationEpubZip,
        applicationXMobiPocketEbook: applicationXMobiPocketEbook ?? this.applicationXMobiPocketEbook,
        applicationRdfXml: applicationRdfXml ?? this.applicationRdfXml,
        imageJpeg: imageJpeg ?? this.imageJpeg,
        textPlainCharsetUsaSCII: textPlainCharsetUsaSCII ?? this.textPlainCharsetUsaSCII,
        applicationOCTETStream: applicationOCTETStream ?? this.applicationOCTETStream,
      );
}
