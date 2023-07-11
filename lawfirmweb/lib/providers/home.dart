import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/header_item.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeProvider());

class HomeProvider extends ChangeNotifier {
  final contactKey = GlobalKey();
  final blogsKey = GlobalKey();
  final bookConsKey = GlobalKey();
  final aboutKey = GlobalKey();
  final homeKey = GlobalKey();

  Future<void> scrollToContact() async {
    final context = contactKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToblogs() async {
    final context = blogsKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollTobookCons() async {
    final context = bookConsKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToAbout() async {
    final context = aboutKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToHome() async {
    final context = homeKey.currentContext;
    await _scroll(context);
  }

  Future _scroll(BuildContext? context) async {
    if (context != null) {
      await Scrollable.ensureVisible(context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
          alignment: 0.4);
    }
  }

  scrollBasedOnHeader(NameOnTap nameOnTap) {
    if (nameOnTap.title == "Contact") {
      scrollToContact();
    } else if (nameOnTap.title == "Home") {
      scrollToHome();
    } else if (nameOnTap.title == "Book Consultation") {
      scrollTobookCons();
    } else if (nameOnTap.title == "Blogs") {
      scrollToblogs();
    } else if (nameOnTap.title == "About") {
      scrollToAbout();
    }
  }
}
