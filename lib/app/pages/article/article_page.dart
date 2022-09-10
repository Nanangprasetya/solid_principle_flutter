import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:solid_principle_app/app/bloc/blocs.dart';
import 'package:solid_principle_app/app/widgets/global/shimmer_custom.dart';
import 'package:solid_principle_app/core/themes/colors.dart';
import 'package:solid_principle_app/core/utils/dimens.dart';
import 'package:solid_principle_app/core/utils/utilis.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => AppUtils.infinityBottom(_scrollController));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleCubit, ArticleState>(
      listener: (context, state) {
        if (state.message != null) {
          Fluttertoast.showToast(msg: state.message!, toastLength: Toast.LENGTH_SHORT);
        }
      },
      builder: (context, state) {
        if (state is ArticleLoaded) {
          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(AppDimens.radiusMedium),
            itemCount: state.hasMax ? state.data.length : state.data.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text('${state.data[index].userId}'),
                title: Text(state.data[index].title),
                subtitle: Text(state.data[index].body),
              );
            },
            separatorBuilder: (_, index) => Divider(color: AppColors.lightGrey),
          );
        } else if (state is ArticleNotLoaded) {
          return Padding(
            padding: const EdgeInsets.all(AppDimens.radiusMedium),
            child: Center(
              child: Text(state.message),
            ),
          );
        } else {
          return ListView.separated(
            padding: const EdgeInsets.all(AppDimens.radiusMedium),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) => ShimmerCustom(
              height: AppDimens.heightListTile,
              width: Get.width,
            ),
            separatorBuilder: (_, index) => SizedBox(height: AppDimens.marginPaddingSmall),
          );
        }
      },
    );
  }
}
