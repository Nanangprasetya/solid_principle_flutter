import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';
import 'package:solid_principle_app/app/widgets/global/bottom_loader.dart';
import 'package:solid_principle_app/app/widgets/global/shimmer_custom.dart';
import '../../../core/core.dart';
import '../../bloc/blocs.dart';
import 'component/photo_content_cmp.dart';

class PhotosPage extends StatefulWidget {
  final PageStorageBucket bucket;

  const PhotosPage({Key? key, required this.bucket}) : super(key: key);

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  late RefreshController _refreshController = RefreshController();
  late ScrollController _scrollController = ScrollController(
    initialScrollOffset: widget.bucket.currentPageScrollOffset(context, KEY_PHOTOS),
  );


  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.infinityBottom()) context.read<PhotosCubit>().getAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotosCubit, PhotosState>(
      listener: (context, state) {
        if (state.message != null) {
          Fluttertoast.showToast(msg: state.message!, toastLength: Toast.LENGTH_SHORT);
        }
      },
      builder: (context, state) {
        if (state is PhotosLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (pos) => widget.bucket.saveScrollOffset(context, pos: pos, key: KEY_PHOTOS),
            child: SmartRefresher(
              controller: _refreshController,
              onRefresh: () {
                context.read<PhotosCubit>().refreshPhotoss();
                _refreshController.refreshCompleted();
              },
              child: ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.all(AppDimens.radiusMedium),
                itemCount: state.hasMax ? state.data.length : state.data.length + 1,
                itemBuilder: (_, index) => index >= state.data.length
                    ? const BottomLoader()
                    : PhotoContentCmp(
                        data: state.data[index],
                      ),
                separatorBuilder: (_, index) => Divider(),
              ),
            ),
          );
        } else if (state is PhotosNotLoaded) {
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
              height: AppDimens.sizeLargeX,
              width: Get.width,
            ),
            separatorBuilder: (_, index) => SizedBox(height: AppDimens.marginPaddingSmall),
          );
        }
      },
    );
  }
}
