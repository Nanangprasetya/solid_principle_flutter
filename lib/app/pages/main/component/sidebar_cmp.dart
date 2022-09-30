import 'package:flutter/material.dart';

class SidebarCmp extends StatelessWidget {
  final int selected;
  final List<Widget> items;

  const SidebarCmp({super.key, required this.items, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      child: items[selected],
    );
  }
}