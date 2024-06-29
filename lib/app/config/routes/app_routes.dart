abstract class AppRoutes {
  static const String root = '/';

  static const String home = '/home';
  static const String detail = '/detail';
  static const String favorite = '/favorite';
  static const String read = '/read';


  ///function to determine which route will be executed first
  static String? initialPage() {
    return home;
  }
}
