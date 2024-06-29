import 'package:books/app/config/constants/link_page_constants.dart';

enum Flavor {
  production,
  uat,
  development,
}

extension FlavorItem on Flavor {
  String get flavorName {
    switch (this) {
      case Flavor.production:
        return "Prod";
      case Flavor.uat:
        return "Uat";
      case Flavor.development:
        return "Dev";
    }
  }

  String get appName {
    switch (this) {
      case Flavor.production:
        return "Books";
      case Flavor.uat:
        return "Books UAT";
      case Flavor.development:
        return "Books Dev";
    }
  }

  String get appVersion {
    switch (this) {
      case Flavor.production:
        return "v1";
      case Flavor.uat:
        return "v1";
      case Flavor.development:
        return "v1";
    }
  }

  String get appVersionName {
    switch (this) {
      case Flavor.production:
        return "1.0.0";
      case Flavor.uat:
        return "1.0.0";
      case Flavor.development:
        return "1.0.0";
    }
  }

  String get baseUrl {
    switch (this) {
      case Flavor.production:
        return baseUrlProd;
      case Flavor.uat:
        return baseUrlUat;
      case Flavor.development:
        return baseUrlDev;
    }
  }
}

class AppConfig {
  final Flavor flavor;
  final String flavorName;
  final String appName;
  final String appVersion;
  final String appVersionName;
  final String baseUrl;

  static AppConfig? _instance;

  AppConfig._internal(
    this.flavor,
    this.flavorName,
    this.appName,
    this.appVersion,
    this.appVersionName,
    this.baseUrl,
  );

  factory AppConfig({
    required Flavor flavor,
  }) =>
      _instance ??= AppConfig._internal(
        flavor,
        flavor.flavorName,
        flavor.appName,
        flavor.appVersion,
        flavor.appVersionName,
        flavor.baseUrl,
      );

  static AppConfig? get instance => _instance;
}
