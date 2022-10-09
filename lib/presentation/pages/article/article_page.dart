import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:solid_domain/solid_domain.dart';

import '../../widgets/widget.dart';
import '../../../core/core.dart';
import '../../bloc/blocs.dart';
import '../page.dart';

class ArticlePage extends StatefulWidget {
  final PageStorageBucket bucket;

  const ArticlePage({Key? key, required this.bucket}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late RefreshController _refreshController = RefreshController();
  late ScrollController _scrollController = ScrollController(
    initialScrollOffset: widget.bucket.currentPageScrollOffset(context, KEY_ARTICLE),
  );

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.infinityBottom()) context.read<ArticleCubit>().getAllData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
      builder: (ctx, state) {
        return ScaffoldResponsive(
          body: _contentBuilder(ctx, state),
          sideBar: state.isInit ? ArticleFormPage(isAdd: true) : ArticleDetailPage(articleEntity: state.articleEntity),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.to(ArticleFormPage(isAdd: true)),
            child: Icon(Icons.add),
            tooltip: 'Add Data',
          ),
        );
      },
    );
  }

  Widget _contentBuilder(BuildContext ctxDtl, ArticleDetailState detail) {
    return NotificationListener<ScrollNotification>(
      onNotification: (pos) => widget.bucket.saveScrollOffset(context, pos: pos, key: KEY_ARTICLE),
      child: BlocConsumer<ArticleCubit, ArticleState>(
        listener: (context, state) {
          if (state.message != null) {
            Fluttertoast.showToast(msg: state.message!, toastLength: Toast.LENGTH_SHORT);
          }
        },
        builder: (context, state) {
          if (state is ArticleLoaded)
            return SmartRefresher(
              controller: _refreshController,
              onRefresh: () {
                context.read<ArticleCubit>().refreshArticles();
                _refreshController.refreshCompleted();
              },
              child: ListView.separated(
                physics: AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                padding: const EdgeInsets.all(AppDimens.radiusMedium),
                itemCount: state.hasMax ? state.data.length : state.data.length + 1,
                itemBuilder: (_, index) => index >= state.data.length
                    ? const BottomLoader()
                    : ListTile(
                        onTap: () => _toDetailPressed(ctxDtl, state.data[index], detail),
                        selected: _selected(context, detail.isInit, detail, state.data[index].id),
                        leading: Text('${state.data[index].id}'),
                        title: Text(state.data[index].title),
                        subtitle: Text(state.data[index].body),
                        selectedColor: AppColors.blackText,
                        selectedTileColor: AppColors.lightOrange2,
                      ),
                separatorBuilder: (_, index) => Divider(),
              ),
            );
          else if (state is ArticleNotLoaded)
            return FailureView(
              onPressed: () => context.read<ArticleCubit>().getAllData(),
              message: state.message,
            );
          else
            return ListLoader();
        },
      ),
    );
  }

  bool _selected(BuildContext context, bool isInit, ArticleDetailState detail, int idData) {  
    return (context.isTabletUnder || isInit) ? false : detail.articleEntity.id == idData;
  }

  void _toDetailPressed(BuildContext ctxDtl, ArticleEntity data, ArticleDetailState detail) {
    if (detail.typeForm.isEdit) return;
    if (ctxDtl.isTabletUnder) {
      ctxDtl.read<ArticleDetailCubit>().set(data, false);
      Get.to(ArticleDetailPage(articleEntity: data));
    } else {
      if (detail.articleEntity.id == data.id) {
        ctxDtl.read<ArticleDetailCubit>().set(ArticleEntity.empty, true);
      } else {
        ctxDtl.read<ArticleDetailCubit>().set(data, false);
      }
    }
  }
}
