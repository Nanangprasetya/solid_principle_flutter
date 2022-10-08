import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';

class ScaffoldResponsive extends StatelessWidget {
  final List<Widget>? actionAppBar;
  final bool? isCenterTitle;
  final Widget? titleAppBar;
  final Widget body;
  final Widget? drawer;
  final Widget? sideBar;
  final Widget? leadingAppBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool? hasLeading;
  final Color? backgroundColor;
  final bool? isNormalFab;
  final bool? isDrawer;

  const ScaffoldResponsive({
    super.key,
    required this.body,
    this.titleAppBar,
    this.drawer,
    this.actionAppBar,
    this.sideBar,
    this.isCenterTitle = false,
    this.leadingAppBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.hasLeading = true,
    this.backgroundColor,
    this.isNormalFab = false,
    this.isDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: titleAppBar != null
          ? AppBar(
              automaticallyImplyLeading: hasLeading!,
              leading: (leadingAppBar != null) ? leadingAppBar : null,
              title: titleAppBar,
              centerTitle: isCenterTitle!,
              actions: actionAppBar,
              elevation: 0,
            )
          : null,
      drawerEnableOpenDragGesture: false,
      drawer: (context.isPhone) ? drawer : null,
      backgroundColor: backgroundColor,
      bottomNavigationBar: (context.isPhone) ? bottomNavigationBar : null,
      floatingActionButton: isNormalFab!
          ? floatingActionButton
          : (context.isTabletUnder)
              ? floatingActionButton
              : null,
      body: context.responsiveValue<Widget>(
        desktop: _desktopLayout(context),
        tablet: _tabletLayout(context),
        mobile: _mobileLayout(context),
      ),
    );
  }

  Widget _desktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (drawer != null)
          SizedBox(
            width: isDrawer! ? AppDimens.maxWidthDrawer : AppDimens.minWidthDrawer,
            child: drawer,
          ),
        Expanded(
          flex: 6,
          child: body,
        ),
        if (sideBar != null)
          Expanded(
            flex: 3,
            child: sideBar!,
          ),
      ],
    );
  }

  Widget _tabletLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (drawer != null)
          SizedBox(
            width: isDrawer! ? AppDimens.maxWidthDrawer : AppDimens.minWidthDrawer,
            child: drawer,
          ),
        Expanded(
          flex: (context.isTabletUnder) ? 1 : 6,
          child: body,
        ),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context) => body;
}
