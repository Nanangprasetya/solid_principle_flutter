import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:solid_principle_app/presentation/pages/user/user.dart';
import '../../../domain/domain.dart';
import '../../widgets/widget.dart';
import '../../../core/core.dart';
import '../../bloc/blocs.dart';

class UserPage extends StatefulWidget {
  final PageStorageBucket bucket;

  const UserPage({Key? key, required this.bucket}) : super(key: key);

  @override
  State<UserPage> createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  late RefreshController _refreshController = RefreshController();
  late ScrollController _scrollController = ScrollController(
    initialScrollOffset: widget.bucket.currentPageScrollOffset(context, KEY_USERS),
  );

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.infinityBottom()) context.read<UserCubit>().getAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailCubit, UserDetailState>(
      builder: (ctx, state) {
        return ScaffoldResponsive(
          sideBar: state.isInit ? null : UserDetailPage(userEntity: state.userEntity),
          body: _contentBuilder(ctx, state),
        );
      },
    );
  }

  Widget _contentBuilder(BuildContext ctxDtl, UserDetailState stateDtl) {
    return NotificationListener<ScrollNotification>(
      onNotification: (pos) => widget.bucket.saveScrollOffset(context, pos: pos, key: KEY_USERS),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state.message != null) {
            Fluttertoast.showToast(msg: state.message!, toastLength: Toast.LENGTH_SHORT);
          }
        },
        builder: (context, state) {
          if (state is UserLoaded)
            return SmartRefresher(
              controller: _refreshController,
              onRefresh: () {
                context.read<UserCubit>().refreshUsers();
                _refreshController.refreshCompleted();
              },
              child: ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.all(AppDimens.radiusMedium),
                itemCount: state.hasMax ? state.data.length : state.data.length + 1,
                itemBuilder: (_, index) => index >= state.data.length
                    ? const BottomLoader()
                    : ListTile(
                        onTap: () => _toDetailPressed(ctxDtl, state.data[index], stateDtl.userEntity.id),
                        selected: _selected(context, stateDtl.isInit, stateDtl.userEntity.id, state.data[index].id),
                        leading: Text('${state.data[index].id}'),
                        title: Text(state.data[index].name),
                        subtitle: Text(state.data[index].phone),
                        selectedColor: AppColors.blackText,
                        selectedTileColor: AppColors.lightOrange2,
                      ),
                separatorBuilder: (_, index) => Divider(),
              ),
            );
          else if (state is UserNotLoaded)
            return FailureView(
              onPressed: () => context.read<UserCubit>().getAllData(),
              message: state.message,
            );
          else
            return ListLoader();
        },
      ),
    );
  }

  bool _selected(BuildContext context, bool isInit, int idDtl, int idData) =>
      (context.isDesktop || isInit) ? false : idDtl == idData;

  void _toDetailPressed(BuildContext ctxDtl, UserEntity data, int id) {
    if (ctxDtl.isDesktop) {
      ctxDtl.read<UserDetailCubit>().setDetail(data, false);
      Get.to(UserDetailPage(userEntity: data));
    } else {
      if (id == data.id) {
        ctxDtl.read<UserDetailCubit>().setDetail(UserEntity.empty, true);
      } else {
        ctxDtl.read<UserDetailCubit>().setDetail(data, false);
      }
    }
  }
}
