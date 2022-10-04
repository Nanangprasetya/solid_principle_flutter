import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../bloc/blocs.dart';
import '../../../widgets/widget.dart';

class BodyInput extends StatelessWidget {
  final bool? isEdit;

  const BodyInput({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
      builder: (_, detail) {
        return BlocBuilder<ArticlePostCubit, ArticlePostState>(
          buildWhen: (previous, current) => previous.body != current.body,
          builder: (ctxPost, post) {
            return BlocBuilder<ArticlePutCubit, ArticlePutState>(
              buildWhen: (previous, current) => previous.body != current.body,
              builder: (ctxPut, put) {
                return TextFieldBasic(
                  onChanged: (value) => detail.typeForm.isEdit
                      ? ctxPut.read<ArticlePutCubit>().onBodyChanged(value)
                      : ctxPost.read<ArticlePostCubit>().onBodyChanged(value),
                  initialValue: detail.typeForm.isEdit ? detail.articleEntity.body : null,
                  title: 'Body',
                  hint: 'Enter Body',
                  multiline: true,
                  validator: (_) => (post.body.invalid || put.body.invalid) ? INVALID_BODY : null,
                );
              },
            );
          },
        );
      },
    );
  }
}
