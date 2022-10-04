import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solid_principle_app/presentation/pages/page.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../../injections.dart';
import '../../bloc/blocs.dart';
import '../../widgets/widget.dart';
import 'component/component.dart';

class ArticleDetailPage extends StatelessWidget {
  final ArticleEntity articleEntity;

  const ArticleDetailPage({super.key, required this.articleEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        if (context.isTabletUnder)
        BlocProvider<ArticleDetailCubit>(
          create: (context) => sl<ArticleDetailCubit>(),
        ),
        BlocProvider<ArticleDeleteCubit>(
          create: (context) => sl<ArticleDeleteCubit>(),
        ),
      ],
      child: BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
        builder: (context, state) {
          return state.typePage.isForm ? ArticleFormPage() : _contentBuilder(context);
        },
      ),
    );
  }

  Widget _contentBuilder(BuildContext context) {
    return ScaffoldResponsive(
      isNormalFab: true,
      backgroundColor: context.isTabletUnder ? AppColors.white : AppColors.lightGrey,
      titleAppBar: context.isTabletUnder ? Text('Article Details') : null,
      floatingActionButton: _fabBuilder(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimens.marginPaddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListRowWidget(label: 'Id', value: '${articleEntity.id}'),
              Divider(height: AppDimens.marginPaddingExtraLarge),
              ListRowWidget(label: 'User Id', value: '${articleEntity.userId}'),
              Divider(height: AppDimens.marginPaddingExtraLarge),
              ListRowWidget(label: 'Title', value: articleEntity.title, multiLine: true),
              Divider(height: AppDimens.marginPaddingExtraLarge),
              ListRowWidget(label: 'Body', value: articleEntity.body, multiLine: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fabBuilder(BuildContext context) {
    return BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
      builder: (ctxDtl, _) {
        return BlocConsumer<ArticleDeleteCubit, ArticleDeleteState>(
          listener: (_, state) {
            if (state is ArticleDeleteNotLoaded || state is ArticleDeleteLoaded) {
              Fluttertoast.showToast(msg: state.message!, toastLength: Toast.LENGTH_SHORT);
            }
          },
          builder: (context, state) {
            return FabArticle(
              isLoadingDelete: state is ArticleDeleteLoading,
              onDelete: () => context.read<ArticleDeleteCubit>().delete(
                    ArticleDeleteEntity(
                      id: articleEntity.id,
                      userId: articleEntity.userId,
                      title: articleEntity.title,
                      body: articleEntity.body,
                    ),
                  ),
              onEdit: () => ctxDtl.read<ArticleDetailCubit>().setToForm(articleEntity),
            );
          },
        );
      },
    );
  }
}
