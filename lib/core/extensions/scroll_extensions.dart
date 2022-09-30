import 'package:flutter/material.dart';

extension ScrollExtension on ScrollController {
  bool infinityBottom() {
    final maxScroll = this.position.maxScrollExtent;
    final currentScroll = this.offset;

    if (!this.hasClients) return false;
    return currentScroll == maxScroll;
  }
}

extension ScrollOffset on PageStorageBucket {
  bool saveScrollOffset(BuildContext context, {required ScrollNotification pos, required String key}) {
    this.writeState(context, pos.metrics.pixels, identifier: key);
    return true;
  }

  double currentPageScrollOffset(BuildContext context, String key) => this.readState(context, identifier: key) ?? 0.0;
}