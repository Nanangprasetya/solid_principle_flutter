
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import 'button_widget.dart';

class FailureView extends StatelessWidget {
  final String message;
  final String? imagePath;
  final void Function() onPressed;
  const FailureView({
    Key? key,
    required this.message,
    this.imagePath,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.radiusMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath ?? AppImages.warningPng, width: Get.width / 2),
            SizedBox(height: AppDimens.marginPaddingLarge),
            Text(message, textAlign: TextAlign.center, style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: AppDimens.marginPaddingLarge),
            SizedBox(
              width: Get.width / 2,
              child: ButtonCustom(
                onPressed: onPressed,
                text: 'Reload Data',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
