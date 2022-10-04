import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../injections.dart';
import '../../bloc/blocs.dart';
import '../../widgets/widget.dart';
import 'component/component.dart';

class ArticleFormPage extends StatelessWidget {
  final bool? isAdd;

  const ArticleFormPage({super.key, this.isAdd = false});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        if(isAdd!)
          BlocProvider<ArticleDetailCubit>(
            create: (context) => sl<ArticleDetailCubit>(),
          ),
        BlocProvider<ArticlePostCubit>(
          create: (context) => sl<ArticlePostCubit>(),
        ),
      ],
      child: BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
        builder: (ctxDtl, detail) {
          return ScaffoldResponsive(
            isNormalFab: true,
            backgroundColor: context.isTabletUnder ? AppColors.white : AppColors.lightGrey,
            titleAppBar: context.isTabletUnder ? Text(detail.typeForm.isEdit ? 'Edit Article' : 'Add Article') : null,
            floatingActionButton: detail.typePage.isForm && !context.isTabletUnder
                ? FloatingActionButton(
                    onPressed: () => ctxDtl.read<ArticleDetailCubit>().setToDetail(),
                    child: Icon(Icons.close),
                    backgroundColor: AppColors.blackButton,
                  )
                : null,
            body: _contentBuilder(context, detail),
          );
        },
      ),
    );
  }

  Widget _contentBuilder(BuildContext context, ArticleDetailState detail) {
    return BlocProvider(
      create: (context) => sl<ArticlePutCubit>()
        ..onTitleChanged(detail.articleEntity.title)
        ..onBodyChanged(detail.articleEntity.body),
      child: Padding(
        padding: EdgeInsets.all(AppDimens.marginPaddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleInput(),
            SizedBox(height: AppDimens.marginPaddingLarge),
            BodyInput(),
            SizedBox(height: AppDimens.marginPaddingLarge),
            ButtonSubmitted(),
          ],
        ),
      ),
    );
  }
}
