import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../widgets/widget.dart';
import '../page.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({Key? key}) : super(key: key);

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late ArticleEntity articleEntity;

  @override
  void initState() {
    super.initState();
    articleEntity = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldResponsive(
      titleAppBar: Text('Article Details'),
      sideBar: ArticleFormPage(),
      body: _contentBuilder(),
    );
  }

  Widget _contentBuilder() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListRowWidget(label: 'Id', value: '${articleEntity.id}'),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'User Id', value: '${articleEntity.userId}'),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Title', value: articleEntity.title, multiLine: true),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Body', value: articleEntity.body, multiLine: true),
          ],
        ),
      ),
    );
  }
}
