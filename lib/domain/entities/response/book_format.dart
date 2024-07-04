class BookFormat {
  String? textHtml;
  String? applicationEpubZip;
  String? applicationXMobiPocketEbook;
  String? applicationRdfXml;
  String? imageJpeg;
  String? textPlainCharsetUsaSCII;
  String? applicationOCTETStream;
  String? textHtmlCharsetUtf;
  String? textHtmlCharsetIso;
  String? textHtmlCharsetUsAscii;
  String? textPlainCharsetUtf;
  String? textPlainCharsetIso;

  BookFormat({
    this.textHtml,
    this.applicationEpubZip,
    this.applicationXMobiPocketEbook,
    this.applicationRdfXml,
    this.imageJpeg,
    this.textPlainCharsetUsaSCII,
    this.applicationOCTETStream,
    this.textHtmlCharsetUtf,
    this.textHtmlCharsetIso,
    this.textHtmlCharsetUsAscii,
    this.textPlainCharsetUtf,
    this.textPlainCharsetIso,
  });

  BookFormat copyWith({
    String? textHtml,
    String? applicationEpubZip,
    String? applicationXMobiPocketEbook,
    String? applicationRdfXml,
    String? imageJpeg,
    String? textPlainCharsetUsaSCII,
    String? applicationOCTETStream,
    String? textHtmlCharsetUtf,
    String? textHtmlCharsetIso,
    String? textHtmlCharsetUsAscii,
    String? textPlainCharsetUtf,
    String? textPlainCharsetIso,
  }) =>
      BookFormat(
        textHtml: textHtml ?? this.textHtml,
        applicationEpubZip: applicationEpubZip ?? this.applicationEpubZip,
        applicationXMobiPocketEbook: applicationXMobiPocketEbook ?? this.applicationXMobiPocketEbook,
        applicationRdfXml: applicationRdfXml ?? this.applicationRdfXml,
        imageJpeg: imageJpeg ?? this.imageJpeg,
        textPlainCharsetUsaSCII: textPlainCharsetUsaSCII ?? this.textPlainCharsetUsaSCII,
        applicationOCTETStream: applicationOCTETStream ?? this.applicationOCTETStream,
        textHtmlCharsetUtf: textHtmlCharsetUtf ?? this.textHtmlCharsetUtf,
        textHtmlCharsetIso: textHtmlCharsetIso ?? this.textHtmlCharsetIso,
        textHtmlCharsetUsAscii: textHtmlCharsetUsAscii ?? this.textHtmlCharsetUsAscii,
        textPlainCharsetUtf: textPlainCharsetUtf ?? this.textPlainCharsetUtf,
        textPlainCharsetIso: textPlainCharsetIso ?? this.textPlainCharsetIso,
      );
}
