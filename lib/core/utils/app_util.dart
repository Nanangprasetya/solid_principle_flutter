import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  const AppUtils._();

  /// For condition if list is max Scroll
  static bool infinityBottom(ScrollController scrollController) {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  static void launch(String uri) async {
    final _url = Uri.parse(uri);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
