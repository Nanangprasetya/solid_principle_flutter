import 'package:flutter/material.dart';
import 'package:solid_principle_app/app/pages/article/article_page.dart';
import 'package:solid_principle_app/app/pages/photos/photos_page.dart';
import 'package:solid_principle_app/app/pages/user/user_page.dart';
import 'package:solid_principle_app/app/widgets/global/scaffold_responsive.dart';
import 'package:solid_principle_app/injection.dart';
import '../../bloc/blocs.dart';
import 'component/drawer_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selected = 0;
  late PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticleCubit>(
          create: (context) => sl<ArticleCubit>()..getAllData(),
        ),
        BlocProvider<PhotosCubit>(
          create: (context) => sl<PhotosCubit>()..getAllData(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => sl<UserCubit>()..getAllData(),
        ),
      ],
      child: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return ScaffoldResponsive(
      titleAppBar: Text('Solid Principle App'),
      leadingAppBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlutterLogo(),
      ),
      drawer: DrawerPage(
          selected: _selected,
          onChange: (int i) {
            setState(() => _selected = i);
            _pageController.jumpToPage(i);
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected,
        onTap: (int i) {
          setState(() => _selected = i);
          _pageController.jumpToPage(i);
        },
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
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int i) => setState(() => _selected = i),
        children: [
          ArticlePage(),
          PhotosPage(),
          UserPage(),
        ],
      ),
    );
  }
}
