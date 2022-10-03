import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../bloc/blocs.dart';
import '../../../widgets/widget.dart';

class BodyInput extends StatelessWidget {
  const BodyInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePostCubit, ArticlePostState>(
      buildWhen: (previous, current) => previous.body != current.body,
      builder: (context, state) {
        return TextFieldBasic(
          onChanged: (value) => context.read<ArticlePostCubit>().onBodyChanged(value),
          title: 'Body',
          hint: 'Enter Body',
          validator: (_) => state.body.invalid ? INVALID_BODY : null,
        );
      },
    );
  }
}
