import 'package:flutter/material.dart';
import '../../../core/core.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback press;
  final bool isActive;
  final bool isDrawer;

  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    required this.isActive,
    required this.isDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      
      message: (isDrawer) ? '' : title,
      child: ListTileTheme(
        selectedColor: AppColors.primary,
        selectedTileColor: AppColors.lightOrange2,
        child: ListTile(
          onTap: press,
          horizontalTitleGap: 0.0,
          selected: isActive,
          textColor: isActive ? AppColors.primary : AppColors.greyText,
          title: Row(
            children: [
              icon,
              (isDrawer) ? SizedBox(width: AppDimens.radiusLarge) : SizedBox(),
              (isDrawer) ? Text(title) : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
