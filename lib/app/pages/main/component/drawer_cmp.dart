import 'package:flutter/material.dart';
import '../../../../core/core.dart';

class DrawerCmp extends StatelessWidget {
  final int selected;
  final Function(int i) onChange;

  const DrawerCmp({super.key, required this.onChange, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      child: ListView(
        children: [
          DrawerHeader( 
            child: FlutterLogo(),
          ),
          DrawerListTile(
            title: "Article",
            isActive: selected == 0,
            icon: Icon(Icons.article),
            press: () => onChange(0),
          ),
          DrawerListTile(
            title: "Photos",
            isActive: selected == 1,
            icon: Icon(Icons.photo_album),
            press: () => onChange(1),
          ),
          DrawerListTile(
            title: "Users",
            isActive: selected == 2,
            icon: Icon(Icons.people),
            press: () => onChange(2),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback press;
  final bool isActive;

  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      selected: isActive,
      textColor: isActive ? AppColors.primary : AppColors.greyText,
      leading: icon,
      title: Text(title),
    );
  }
}
