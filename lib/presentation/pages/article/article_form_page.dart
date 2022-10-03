import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../injections.dart';
import '../../bloc/blocs.dart';
import '../../widgets/widget.dart';
import 'component/component.dart';

class ArticleFormPage extends StatelessWidget {
  const ArticleFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticlePostCubit>(
          create: (context) => sl<ArticlePostCubit>(),
        ),
      ],
      child: _contentBuilder(context),
    );
  }

  Widget _contentBuilder(BuildContext context) {
    return BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
      builder: (ctxDtl, state) {
        return ScaffoldResponsive(
          isNormalFab: true,
          backgroundColor: context.isTabletUnder ? AppColors.white : AppColors.lightGrey,
          titleAppBar: context.isTabletUnder ? Text('Add Article') : null,
          floatingActionButton: state.typePage.isForm && !context.isTabletUnder
              ? FloatingActionButton(
                  onPressed: () => ctxDtl.read<ArticleDetailCubit>().setToDetail(),
                  child: Icon(Icons.close),
                  backgroundColor: AppColors.blackButton,
                )
              : null,
          body: Padding(
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
      },
    );
  }
}
