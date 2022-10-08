import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../bloc/blocs.dart';
import '../../../widgets/widget.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldResponsive(
      backgroundColor: context.isTabletUnder ? AppColors.white : AppColors.lightGrey,
      body: _contentBuilder(),
    );
  }

  BlocBuilder<MainCubit, MainState> _contentBuilder() {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        final selectedTab = state.tab;
        final isDrawer = state.isDrawer;

        return Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  DrawerHeaderWidget(
                    isDrawer: isDrawer,
                    urlAvatar: 'https://avatars.githubusercontent.com/u/47396677?v=4',
                    title: 'Nanang Prasetya',
                    subTitle: 'Flutter Developer',
                  ),
                  DrawerListTile(
                    title: "Article",
                    icon: Icon(Icons.article),
                    isActive: selectedTab.isArticle,
                    isDrawer: isDrawer,
                    press: () => context.read<MainCubit>().setTab(MainTab.article.index),
                  ),
                  DrawerListTile(
                    title: "Photos",
                    icon: Icon(Icons.photo_album),
                    isActive: selectedTab.isPhotos,
                    isDrawer: isDrawer,
                    press: () => context.read<MainCubit>().setTab(MainTab.photos.index),
                  ),
                  DrawerListTile(
                    title: "Users",
                    icon: Icon(Icons.people),
                    isActive: selectedTab.isUsers,
                    isDrawer: isDrawer,
                    press: () => context.read<MainCubit>().setTab(MainTab.users.index),
                  ),
                ],
              ),
            ),
            DrawerListTile(
              title: isDrawer ? "Close the Drawer" : "Open the Drawer",
              isActive: false,
              isDrawer: isDrawer,
              icon: Icon(isDrawer ? Icons.arrow_back_ios_new_outlined : Icons.arrow_forward_ios_outlined),
              press: () => context.read<MainCubit>().setDrawer(isDrawer),
            ),
          ],
        );
      },
    );
  }
}
