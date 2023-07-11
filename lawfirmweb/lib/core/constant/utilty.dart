// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';
//Footer Info
class Utilty {
  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future<void> openMail() => openUrl("");

  static Future<void> openMyLocation() =>
      openUrl("https://goo.gl/maps/KmSx7hytSUcBy3fa7");
  static Future<void> openMyPhoneNo() => openUrl("tel:+96170593597");
  static Future<void> openWhatsapp() => openUrl("https://wa.me/970593597");
}
