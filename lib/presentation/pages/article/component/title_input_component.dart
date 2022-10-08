import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../bloc/blocs.dart';
import '../../../widgets/widget.dart';

class TitleInput extends StatelessWidget {
  final bool? isEdit;

  const TitleInput({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
      builder: (_, detail) {
        return BlocBuilder<ArticlePostCubit, ArticlePostState>(
          buildWhen: (previous, current) => previous.title != current.title,
          builder: (ctxPost, post) {
            return BlocBuilder<ArticlePutCubit, ArticlePutState>(
              buildWhen: (previous, current) => previous.title != current.title,
              builder: (ctxPut, put) {
                return TextFieldBasic(
                  onChanged: (value) => detail.typeForm.isEdit
                      ? ctxPut.read<ArticlePutCubit>().onTitleChanged(value)
                      : ctxPost.read<ArticlePostCubit>().onTitleChanged(value),
                  initialValue: detail.typeForm.isEdit ? detail.articleEntity.title : null,
                  title: 'Title',
                  hint: 'Enter Title',
                  multiline: true,
                  errorText: (post.title.invalid && put.title.invalid) ? INVALID_TITLE : null,
                );
              },
            );
          },
        );
      },
    );
  }
}
