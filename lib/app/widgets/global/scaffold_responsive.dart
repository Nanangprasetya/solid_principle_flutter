import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScaffoldResponsive extends StatelessWidget {
  final Widget titleAppBar;
  final List<Widget>? actionAppBar;
  final bool? isCenterTitle;
  final Widget body;
  final Widget drawer;
  final Widget? sideBar;
  final Widget? leadingAppBar;
  final Widget? bottomNavigationBar;
  final bool? hasLeading;

  const ScaffoldResponsive({
    super.key,
    required this.body,
    required this.titleAppBar,
    required this.drawer,
    this.actionAppBar,
    this.sideBar,
    this.isCenterTitle = false,
    this.leadingAppBar,
    this.bottomNavigationBar,
    this.hasLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        automaticallyImplyLeading: hasLeading!,
        leading: (leadingAppBar != null) ? leadingAppBar : null,
        title: titleAppBar,
        centerTitle: isCenterTitle!,
        actions: actionAppBar,
      ),
      drawerEnableOpenDragGesture: false,
      drawer: (context.isPhone) ? drawer : null,
      bottomNavigationBar: (context.isPhone) ? bottomNavigationBar : null,
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
        Expanded(
          flex: 2,
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
        Expanded(
          flex: 2,
          child: drawer,
        ),
        Expanded(
          flex: 6,
          child: body,
        ),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context) {
    return body;
  }
}
