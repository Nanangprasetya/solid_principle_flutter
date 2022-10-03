import 'package:flutter/material.dart';
import 'package:solid_principle_app/injections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widget.dart';
import '../../bloc/blocs.dart';
import '../page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(
          create: (context) => sl<MainCubit>(),
        ),
        BlocProvider<ArticleCubit>(
          create: (context) => sl<ArticleCubit>()..getAllData(),
        ),
        BlocProvider<PhotosCubit>(
          create: (context) => sl<PhotosCubit>()..getAllData(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => sl<UserCubit>()..getAllData(),
        ),
        BlocProvider<ArticleDetailCubit>(
          create: (context) => sl<ArticleDetailCubit>(),
        ),
        BlocProvider<PhotosDetailCubit>(
          create: (context) => sl<PhotosDetailCubit>(),
        ),
        BlocProvider<UserDetailCubit>(
          create: (context) => sl<UserDetailCubit>(),
        ),
      ],
      child: _contentBuilder(context),
    );
  }

  Widget _contentBuilder(BuildContext context) {
    late PageStorageBucket _bucketArticle = PageStorageBucket();
    late PageStorageBucket _bucketPhotos = PageStorageBucket();
    late PageStorageBucket _bucketUsers = PageStorageBucket();

    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        final selectedTab = state.tab;

        return ScaffoldResponsive(
          titleAppBar: Text('Solid Principle App'),
          leadingAppBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlutterLogo(),
          ),
          drawer: DrawerComponent(
            selected: selectedTab,
            onChange: (tab) => context.read<MainCubit>().setTab(tab.index),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedTab.index,
            onTap: (index) => context.read<MainCubit>().setTab(index),
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.article),
                icon: Icon(Icons.article_outlined),
                label: 'Article',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.photo_album),
                icon: Icon(Icons.photo_album_outlined),
                label: 'Photos',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.people),
                icon: Icon(Icons.people_outline),
                label: 'Users',
              ),
            ],
          ),
          body: IndexedStack(
            index: selectedTab.index,
            children: [
              ArticlePage(bucket: _bucketArticle),
              PhotosPage(bucket: _bucketPhotos),
              UserPage(bucket: _bucketUsers),
            ],
          ),
        );
      },
    );
  }
}
