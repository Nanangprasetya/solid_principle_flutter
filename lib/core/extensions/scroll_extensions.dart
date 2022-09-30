import 'package:flutter/material.dart';

extension ScrollExtension on ScrollController {
  bool infinityBottom() {
    final maxScroll = this.position.maxScrollExtent;
    final currentScroll = this.offset;

    if (!this.hasClients) return false;
    return currentScroll == maxScroll;
  }
}
