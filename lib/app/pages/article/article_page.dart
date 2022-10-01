import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../widgets/widget.dart';
import '../../../core/core.dart';
import '../../bloc/blocs.dart';

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
                        leading: Text('${state.data[index].id}'),
                        title: Text(state.data[index].title),
                        subtitle: Text(state.data[index].body),
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
}
