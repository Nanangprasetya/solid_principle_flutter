import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/core.dart';
import 'package:solid_domain/solid_domain.dart';
import '../../bloc/blocs.dart';
import '../../widgets/widget.dart';
import '../page.dart';

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
    return BlocBuilder<PhotosDetailCubit, PhotosDetailState>(
      builder: (ctx, state) {
        return ScaffoldResponsive(
          sideBar: state.isInit ? null : PhotosDetailPage(photosEntity: state.photosEntity),
          body: _contentBuilder(ctx, state),
        );
      },
    );
  }

  Widget _contentBuilder(BuildContext ctxDtl, PhotosDetailState stateDtl) {
    return NotificationListener<ScrollNotification>(
      onNotification: (pos) => widget.bucket.saveScrollOffset(context, pos: pos, key: KEY_PHOTOS),
      child: BlocConsumer<PhotosCubit, PhotosState>(
        listener: (context, state) {
          if (state.message != null) {
            Fluttertoast.showToast(msg: state.message!, toastLength: Toast.LENGTH_SHORT);
          }
        },
        builder: (context, state) {
          if (state is PhotosLoaded)
            return SmartRefresher(
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
                    : PhotoContentComponent(
                        onPressed: () => _toDetailPressed(ctxDtl, state.data[index], stateDtl.photosEntity.id),
                        selected: _selected(context, stateDtl.isInit, stateDtl.photosEntity.id, state.data[index].id),
                        data: state.data[index],
                      ),
                separatorBuilder: (_, index) => Divider(),
              ),
            );
          else if (state is PhotosNotLoaded)
            return FailureView(
              onPressed: () => context.read<PhotosCubit>().getAllData(),
              message: state.message,
            );
          else
            return ListLoader();
        },
      ),
    );
  }

  bool _selected(BuildContext context, bool isInit, int idDtl, int idData) =>
      (context.isTabletUnder || isInit) ? false : idDtl == idData;

  void _toDetailPressed(BuildContext ctxDtl, PhotosEntity data, int id) {
    if (ctxDtl.isTabletUnder) {
      ctxDtl.read<PhotosDetailCubit>().set(data, false);
      Get.to(PhotosDetailPage(photosEntity: data));
    } else {
      if (id == data.id) {
        ctxDtl.read<PhotosDetailCubit>().set(PhotosEntity.empty, true);
      } else {
        ctxDtl.read<PhotosDetailCubit>().set(data, false);
      }
    }
  }
}
