import 'package:flutter/material.dart';
import 'package:solid_principle_app/presentation/widgets/widget.dart';

import '../../../../core/core.dart';

class FabArticle extends StatelessWidget {
  final bool? isLoadingEdit;
  final bool? isLoadingDelete;
  final void Function() onEdit;
  final void Function() onDelete;

  const FabArticle({
    super.key,
    required this.onEdit,
    required this.onDelete,
    this.isLoadingEdit = false,
    this.isLoadingDelete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: isLoadingDelete! ? null : onDelete,
          child: isLoadingDelete! ? ButtonLoader() : Icon(Icons.delete),
          backgroundColor: AppColors.red,
          tooltip: 'Delete Data',
          heroTag: 'tag_2',
        ),
        SizedBox(height: AppDimens.marginPaddingMedium),
        FloatingActionButton(
          onPressed: isLoadingEdit! ? null : onEdit,
          child: isLoadingEdit! ? ButtonLoader() : Icon(Icons.edit),
          tooltip: 'Edit Data',
          heroTag: 'tag_1',
        ),
      ],
    );
  }
}
