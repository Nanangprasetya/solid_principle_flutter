import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../widgets/widget.dart';

class UserDetailPage extends StatelessWidget {
  final UserEntity userEntity;
  const UserDetailPage({Key? key, required this.userEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldResponsive(
      backgroundColor: context.isTabletUnder ? AppColors.white : AppColors.lightGrey,
      titleAppBar: context.isTabletUnder ? Text('User Details') : null,
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
            ListRowWidget(label: 'Id', value: '${userEntity.id}'),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Name', value: userEntity.name),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Username', value: userEntity.username),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Email', value: userEntity.email),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Phone', value: userEntity.phone),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Website', value: userEntity.website),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Street', value: userEntity.address.street),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'City', value: userEntity.address.city),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Zip Code', value: userEntity.address.zipcode),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Lat', value: userEntity.address.lat),
            Divider(height: AppDimens.marginPaddingExtraLarge),
            ListRowWidget(label: 'Lng', value: userEntity.address.lng),
          ],
        ),
      ),
    );
  }
}
