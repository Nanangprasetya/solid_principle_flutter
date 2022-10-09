import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/core.dart';
import 'package:solid_domain/solid_domain.dart';
import '../../../widgets/global/shimmer_custom.dart';

class PhotoContentComponent extends StatelessWidget {
  final PhotosEntity data;
  final void Function()? onPressed;
  final bool? selected;

  const PhotoContentComponent({super.key, required this.data, required this.onPressed, required this.selected});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      selectedColor: AppColors.blackText,
      selectedTileColor: AppColors.lightOrange2,
      child: ListTile(
        onTap: onPressed,
        selected: selected!,
        leading: CachedNetworkImage(
          imageUrl: data.thumbnailUrl,
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
        title: Text(data.title),
        subtitle: Text(data.url),
      ),
    );
  }
}
