import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../widgets/widget.dart';

class PhotosDetailPage extends StatelessWidget {
  final PhotosEntity photosEntity;

  const PhotosDetailPage({super.key, required this.photosEntity});

  @override
  Widget build(BuildContext context) {
    return ScaffoldResponsive(
      backgroundColor: context.isDesktop ? AppColors.white : AppColors.lightGrey,
      titleAppBar: context.isDesktop ? Text('Photo Details') : null,
      body: _contentBuilder(),
    );
  }

  Widget _contentBuilder() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: photosEntity.url,
              imageBuilder: (context, imageProvider) => Container(
                width: AppDimens.sizeLong,
                height: AppDimens.sizeLong,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 2.0),
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              fit: BoxFit.cover,
              placeholder: (_, url) => ClipOval(
                child: ShimmerCustom(
                  width: AppDimens.sizeLong,
                  height: AppDimens.sizeLong,
                ),
              ),
              errorWidget: (_, url, error) => Container(
                width: AppDimens.sizeLong,
                height: AppDimens.sizeLong,
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
            SizedBox(height: AppDimens.sizeNormalX),
            ListRowWidget(label: 'Id', value: '${photosEntity.id}'),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Photo Id', value: '${photosEntity.albumId}'),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Title', value: photosEntity.title, multiLine: true),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Url', value: photosEntity.url),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Thumbnail Url', value: photosEntity.thumbnailUrl),
          ],
        ),
      ),
    );
  }
}
