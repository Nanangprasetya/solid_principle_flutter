import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../page.dart';

class SidebarComponent extends StatelessWidget {
  final MainTab selected;
  const SidebarComponent({
    super.key,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    switch (selected) {
      case MainTab.article:
        return ArticleFormPage();
      default:
        return SizedBox();
    }
  }
}
