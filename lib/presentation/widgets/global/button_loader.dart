import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ButtonLoader extends StatelessWidget {
  const ButtonLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 10,
        height: 10,
        child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 1.8),
      );
  }
}
