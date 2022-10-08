import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:formz/formz.dart';

import '../../../../core/core.dart';
import '../../../bloc/blocs.dart';
import '../../../widgets/widget.dart';

class ButtonSubmitted extends StatelessWidget {
  final bool? isEdit;

  const ButtonSubmitted({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
      builder: (_, detail) {
        return BlocConsumer<ArticlePostCubit, ArticlePostState>(
          buildWhen: (previous, current) => previous.status != current.status,
          listener: (_, post) {
            if (post.status.isSubmissionSuccess || post.status.isSubmissionFailure)
              Fluttertoast.showToast(msg: post.message, toastLength: Toast.LENGTH_SHORT);
          },
          builder: (ctxPost, post) {
            return BlocConsumer<ArticlePutCubit, ArticlePutState>(
              listener: (_, put) {
                if (put.status.isSubmissionSuccess || put.status.isSubmissionFailure)
                  Fluttertoast.showToast(msg: put.message, toastLength: Toast.LENGTH_SHORT);
              },
              builder: (ctxPut, put) {
                return ButtonCustom(
                  onPressed: () {
                    if (post.status.isValidated) ctxPost.read<ArticlePostCubit>().onPost();
                    if (put.status.isValidated) ctxPut.read<ArticlePutCubit>().onPut(detail.articleEntity.id);
                  },
                  child: (post.status.isSubmissionInProgress || put.status.isSubmissionInProgress)
                      ? ButtonLoader()
                      : Text(detail.typeForm.isEdit ? 'Edit Data' : 'Save Data'),
                );
              },
            );
          },
        );
      },
    );
  }
}
