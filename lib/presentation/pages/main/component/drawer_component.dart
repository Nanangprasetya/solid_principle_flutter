import 'package:flutter/material.dart';
import 'package:solid_principle_app/core/core.dart';
import '../../../widgets/widget.dart';

class DrawerComponent extends StatelessWidget {
  final MainTab selected;
  final Function(MainTab i) onChange;

  const DrawerComponent({super.key, required this.onChange, required this.selected});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader( 
          child: FlutterLogo(),
        ),
        DrawerListTile(
          title: "Article",
          isActive: selected == MainTab.article,
          icon: Icon(Icons.article),
          press: () => onChange(MainTab.article),
        ),
        DrawerListTile(
          title: "Photos",
          isActive: selected == MainTab.photos,
          icon: Icon(Icons.photo_album),
          press: () => onChange(MainTab.photos),
        ),
        DrawerListTile(
          title: "Users",
          isActive: selected == MainTab.users,
          icon: Icon(Icons.people),
          press: () => onChange(MainTab.users),
        ),
      ],
    );
  }
}
