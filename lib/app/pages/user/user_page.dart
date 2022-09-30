import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:solid_principle_app/app/widgets/global/bottom_loader.dart';
import 'package:solid_principle_app/app/widgets/global/shimmer_custom.dart';
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
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state.message != null) {
          Fluttertoast.showToast(msg: state.message!, toastLength: Toast.LENGTH_SHORT);
        }
      },
      builder: (context, state) {
        if (state is UserLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (pos) => widget.bucket.saveScrollOffset(context, pos: pos, key: KEY_USERS),
            child: SmartRefresher(
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
                        leading: Text('${state.data[index].id}'),
                        title: Text(state.data[index].name),
                        subtitle: Text(state.data[index].phone),
                      ),
                separatorBuilder: (_, index) => Divider(),
              ),
            ),
          );
        } else if (state is UserNotLoaded) {
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
