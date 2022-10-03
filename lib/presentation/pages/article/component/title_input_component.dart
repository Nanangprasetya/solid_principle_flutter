import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../bloc/blocs.dart';
import '../../../widgets/widget.dart';

class TitleInput extends StatelessWidget {
  const TitleInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePostCubit, ArticlePostState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) {
        return TextFieldBasic(
          onChanged: (value) => context.read<ArticlePostCubit>().onTitleChanged(value),
          title: 'Title',
          hint: 'Enter Title',
          validator: (_) => state.title.invalid ? INVALID_TITLE : null,
        );
      },
    );
  }
}
