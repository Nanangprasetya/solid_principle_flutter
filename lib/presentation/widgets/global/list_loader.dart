import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import 'shimmer_custom.dart';

class ListLoader extends StatelessWidget {
  const ListLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppDimens.radiusMedium),
      itemCount: 5,
      itemBuilder: (_, index) => ShimmerCustom(
        height: AppDimens.sizeLong,
        width: Get.width,
      ),
      separatorBuilder: (_, index) => SizedBox(height: AppDimens.marginPaddingSmall),
    );
  }
}
