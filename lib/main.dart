import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:solid_data_api/solid_data_api.dart';
import 'package:solid_domain/solid_domain.dart';

import 'app/injector/injector.dart';
import 'app/pages/main/main_page.dart';
import 'core/themes/colors.dart';

final sl = GetIt.instance;

void mainCommon(FlavorConfig env) {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies(sl);
  SolidDomain.init(sl);
  SolidDataApi.init(env: env, getIt: sl);

  runApp(const Apps());
}

class Apps extends StatelessWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Solid Principle',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColors.primary,
              secondary: AppColors.secondary,
            ),
        appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
      ),
      home: MainPage(),
    );
  }
}
