import 'package:flutter/material.dart';

import '../model/header_model.dart';

class HeaderController {
  static List<HeaderItem> get headerItems => [
        HeaderItem(
          title: "Home",
          iconData: Icons.home,
          onTap: () {},
        ),
        HeaderItem(
          title: "About",
          onTap: () {},
          iconData: Icons.info,
        ),
        HeaderItem(
          title: "Book Consultation",
          onTap: () {},
          iconData: Icons.school,
        ),
        HeaderItem(
          title: "Blogs",
          onTap: () {},
          iconData: Icons.work,
        ),
        HeaderItem(
          title: "Contact",
          onTap: () {},
          iconData: Icons.contact_mail,
        ),
      ];
}
