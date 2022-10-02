import 'package:flutter/material.dart';
import 'package:solid_principle_app/core/core.dart';

class FabComponent extends StatelessWidget {
  final MainTab selected;
  final Function(MainTab i) onChange;

  const FabComponent({super.key, required this.selected, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onChange(selected),
      child: Icon(Icons.add),
      tooltip: 'Tambah Data',
    );
  }
}
