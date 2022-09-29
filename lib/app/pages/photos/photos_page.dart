import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:solid_principle_app/app/bloc/blocs.dart';
import 'package:solid_principle_app/app/widgets/global/shimmer_custom.dart';
import 'package:solid_principle_app/core/utils/dimens_util.dart';
import 'package:solid_principle_app/themes/themes/themes.dart';

class PhotosPage extends StatefulWidget {
  PhotosPage({Key? key}) : super(key: key);

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
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
          return ListView.separated(
            padding: const EdgeInsets.all(AppDimens.radiusMedium),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text('$index'),
                title: Text('title'),
                subtitle: Text('subtitle'),
              );
            },
            separatorBuilder: (_, index) => Divider(color: AppColors.lightGrey),
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
