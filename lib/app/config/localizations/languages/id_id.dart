import 'package:books/app/config/localizations/translation_key.dart';

class IdID {
  static const String tryAgain = "Coba Lagi";
  static const String errorTitleConnection = "Tidak Terhubung";
  static const String errorTitleDataNotFound = "Data Tidak Ditemukan";
  static const String errorTitleNotFound = "Tidak Ditemukan";
  static const String errorTitleSystemError = "Terjadi Kesalahan";
  static const String errorTitleServerError = "Terjadi Kesalahan";
  static const String errorSubtitleConnection = "Internet anda bermasalah. Harap cek koneksi internet atau Wi-Fi kamu lalu coba lagi.";
  static const String errorSubtitleDataNotFound = "Data yang anda minta tidak dapat ditemukan. Harap cek kembali lalu coba lagi.";
  static const String errorSubtitleNotFound = "Tindakan yang anda lakukan untuk sementara tidak ditemukan. harap hubungi kami.";
  static const String errorSubtitleSystemError = "Terjadi kesalahan pada sistem. harap coba lagi beberapa saat kemudian.";
  static const String errorSubtitleServerError = "Terjadi kesalahan pada server. harap coba lagi beberapa saat kemudian.";

  static const String noConnection = "Tidak ada koneksi";
  static const String noConnectionDescription = "Pastikan anda terhubung ke jaringan internet.";

  static const String loading = "Memuat";
  static const String pleaseWait = "Harap Tunggu";
  static const String developmentTitle = "Dalam Pengembangan";
  static const String developmentSubtitle = "Maaf, fitur ini tidak dapat diakses karena sedang dalam pengembangan. terima kasih.";

  static const String indonesian = "Indonesia";
  static const String english = "Inggris";

  static const String success = "Berhasil";
  static const String warning = "Peringatan";
  static const String error = "Kesalahan";
  static const String notification = "Pemberitahuan";
  static const String close = "Tutup";
  static const String yes = "Iya";
  static const String no = "Tidak";
  static const String ok = "Oke";

  static const String messageExceptionConnection = "Tidak dapat terhubung dengan server.";
  static const String messageExceptionConnectTimeOut = "Gagal terhubung dengan server karena Time Out.";
  static const String messageExceptionBadCertificate = "Gagal terhubung dengan server karena Sertifikat SSL.";
  static const String messageExceptionSendTimeOut = "Gagal mengirim data ke server karena Time Out.";
  static const String messageExceptionReceiveTimeOut = "Gagal mendapatkan data dari server karena Time Out.";
  static const String messageExceptionCancel = "Permintaan ke server dibatalkan.";
  static const String messageExceptionResponse = "Mendapatkan data response dari server.";
  static const String messageExceptionOther = "Terdapat kesalahan lainnya saat mencoba melakukan permintaan ke server.";
  static const String messageExceptionUndefined = "Terjadi kesalahan internal pada sistem";

  static const String mustBeFilled = "Harus diisi";
  static const String incorrectFormat = "Format salah";
  static const String newPasswordNotMatchEtc = "Kata Sandi Baru dan Konfirmasi Kata Sandi tidak sama";
  static const String cannotBeFilled0 = "Tidak dapat diisi 0";
  static const String exceededMax = "Melebihi maks";
  static const String containsAtLeastNCharacters = "Minimal berisi 6 karakter";

  static Map<String, String> get messages => {
        baseLoadingAndErrorRefreshButton: tryAgain.toUpperCase(),
        baseLoadingAndErrorErrorTitle1: errorTitleConnection,
        baseLoadingAndErrorErrorTitle2: errorTitleDataNotFound,
        baseLoadingAndErrorErrorTitle3: errorTitleNotFound,
        baseLoadingAndErrorErrorTitle4: errorTitleSystemError,
        baseLoadingAndErrorErrorTitle5: errorTitleServerError,
        baseLoadingAndErrorErrorMessage1: errorSubtitleConnection,
        baseLoadingAndErrorErrorMessage2: errorSubtitleDataNotFound,
        baseLoadingAndErrorErrorMessage3: errorSubtitleNotFound,
        baseLoadingAndErrorErrorMessage4: errorSubtitleSystemError,
        baseLoadingAndErrorErrorMessage5: errorSubtitleServerError,
        baseErrorTitle1: noConnection,
        baseErrorMessage1: noConnectionDescription,
        generalLoading: "$loading...",
        generalPleaseWait: "$pleaseWait...",
        generalDevelopmentTitle: developmentTitle,
        generalDevelopmentSubtitle: developmentSubtitle,
        language1: indonesian,
        language2: english,
        modalTitleSuccess: success,
        modalTitleError: error,
        modalTitleWarning: warning,
        modalTextYes: yes.toUpperCase(),
        modalTextNo: no.toUpperCase(),
        modalTextOk: ok.toUpperCase(),
        snackBarTitleSuccess: success,
        snackBarTitleError: error,
        snackBarTitleWarning: warning,
        snackBarTitleNotification: notification,
        snackBarTextClose: close.toUpperCase(),
        bottomSheetTextOk: ok.toUpperCase(),
        messageAEConnection: messageExceptionConnection,
        messageAEConnectTimeOut: messageExceptionConnectTimeOut,
        messageAEBadCertificate: messageExceptionBadCertificate,
        messageAESendTimeOut: messageExceptionSendTimeOut,
        messageAEReceiveTimeOut: messageExceptionReceiveTimeOut,
        messageAECancel: messageExceptionCancel,
        messageAEResponse: messageExceptionResponse,
        messageAEOther: messageExceptionOther,
        messageAEUndefined: messageExceptionUndefined,
        validatorMessageEmptyInput: "$mustBeFilled!",
        validatorMessageInvalidFormat: "$incorrectFormat.",
        validatorMessageNewPasswordNotMatch: "$newPasswordNotMatchEtc.",
        validatorMessageMinInputNumeric: "$cannotBeFilled0.",
        validatorMessageMaxInputNumeric: "$exceededMax.",
        validatorMessageMinimumPassword: containsAtLeastNCharacters,
      };
}
