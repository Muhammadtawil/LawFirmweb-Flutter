import 'package:flutter/material.dart';

// const Color kPrimaryColor = Color.fromRGBO(100, 6, 5, 1);

const Color kPrimaryColor = Color.fromRGBO(37, 97, 209, 1);

const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromARGB(255, 243, 22, 22);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1920;
const double kTabletMaxWidth = double.infinity;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

class AppConstants {
  static const lawyer = "assets/images/lawyer.jpg";
}
