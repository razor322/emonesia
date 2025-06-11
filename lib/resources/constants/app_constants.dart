// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String appName = 'Emonesia';
  static const String appVersion = '1.0.0';
  static const String Baseurl =
      "https://3d74-2404-8000-1055-276-a87d-a6a5-3e40-2de6.ngrok-free.app";
  static const String BaseRoute = "/predict";
  static const String apiBaseUrl = Baseurl + BaseRoute;

  static const Duration SPLASH_DURATION = Duration(seconds: 2);
  static const Duration TOAST_DURATION = Duration(seconds: 5);

  /// DIO HEADER
  static const Map<String, String> DIO_HEADER = {
    "Content-Type": "application/json"
  };

  /// TEXT LABEL
  static const String LABEL_HOME_HEADER = 'Apa yang bisa saya bantu?';
  static const String LABEL_HOME_SUBHEADER =
      'Masukkan kata kunci,dan periode waktu biarkan Emonesia membaca emosi publik untukmu.';
  static const String LABEL_HASIL_HEADER = 'Hasil Analisis Emosi';
  static const String LABEL_HASIL_SUBHEADER = 'mengandung emosi...';
  static const String LABEL_HASIL_EMOSI = 'Emosi teratas';
  static const String LABEL_HASIL_DETEKSI = 'Terdeteksi';
  static const String LABEL_JUMLAH = 'kali';
  static const String LABEL_TITLE_DIALOG = 'Akhiri Analisis?';
  static const String LABEL_SUBTITLE_DIALOG =
      'Hasil analisis sudah ditampilkan. Ingin kembali ke pencarian data?';

  ///INPUT HINT
  static const String HINT_SEARCH = 'Masukkan topik atau kata kunci';

  ///BUTTON TEXT
  static const String ACTION_SEARCH = 'Cari';
  static const String ACTION_CANCEL = 'Tetap di Sini';
  static const String ACTION_CONFIRM = 'Kembali ke Pencarian';

  /// Message
  static const String MESSAGE_NO_INTERNET =
      'Tidak ada koneksi internet, silakan periksa koneksi Anda.';
  static const String MESSAGE_ERROR = 'Terjadi kesalahan, silakan coba lagi.';
  static const String MESSAGE_EMPTY_RESULT =
      'Tidak ada hasil yang ditemukan, silakan coba dengan kata kunci lain.';
  static const String MESSAGE_LOADING = 'Memuat...';

  /// State Title
  static const String LABEL_ERROR_TITLE = "Oops!";
  static const String LABEL_SUCCESS_TITLE = "Success!";
  static const String LABEL_UNKNOWN_ERROR = "Unknown Error";
  static const String LABEL_PERMISSION_DENIED = "Izin penyimpanan ditolak";
}
