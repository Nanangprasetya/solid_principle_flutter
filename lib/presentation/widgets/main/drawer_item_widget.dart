import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

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
    return Tooltip(
      message: (context.isLargeTablet) ? '' : title,
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
              (context.isLargeTablet) ? SizedBox(width: AppDimens.radiusLarge) : SizedBox(),
              (context.isLargeTablet) ? Text(title) :SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
