import 'package:flutter/material.dart';

class SidebarPage extends StatelessWidget {
  final int selected;
  final List<Widget> items;

  const SidebarPage({super.key, required this.items, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      child: items[selected],
    );
  }
}

// TODO ; for form Article
// SingleChildScrollView(
//         padding: EdgeInsetsDirectional.all(AppDimens.marginPaddingMedium),
//         child: Column(
//           children: [
//             TextFieldBasic(
//               controller: TextEditingController(),
//               title: 'Title',
//               hint: 'Enter Title',
//             ),
//             Divider(color: AppColors.lightGrey),
//             TextFieldBasic(
//               controller: TextEditingController(),
//               title: 'Body',
//               hint: 'Enter Body',
//             ),
//           ],
//         ),
//       ),