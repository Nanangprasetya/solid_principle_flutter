import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../widget.dart';

class DrawerHeaderWidget extends StatelessWidget {
  final String urlAvatar;
  final String title;
  final String subTitle;
  final bool isDrawer;
  final Function()? onPressed;

  const DrawerHeaderWidget({
    Key? key,
    required this.urlAvatar,
    required this.title,
    required this.subTitle,
    required this.isDrawer,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: (isDrawer) ? EdgeInsets.all(AppDimens.marginPaddingMedium) : EdgeInsets.only(left: 8.0, top: 16.0, bottom: 8.0),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: urlAvatar,
              imageBuilder: (context, imageProvider) => Container(
                width: AppDimens.sizeLarge,
                height: AppDimens.sizeLarge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 2.0),
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              fit: BoxFit.cover,
              placeholder: (_, url) => ClipOval(
                child: ShimmerCustom(
                  width: AppDimens.sizeLarge,
                  height: AppDimens.sizeLarge,
                ),
              ),
              errorWidget: (_, url, error) => Container(
                width: AppDimens.sizeLarge,
                height: AppDimens.sizeLarge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 2.0),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.profilePng),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (isDrawer) SizedBox(width: AppDimens.marginPaddingSmallXX),
            (isDrawer)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: context.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600)),
                      SizedBox(height: AppDimens.marginPaddingSmallX),
                      Text(subTitle, style: context.textTheme.bodyText2)
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
