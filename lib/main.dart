import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:solid_principle_app/injection.dart';
import 'app/pages/main/main_page.dart';
import 'core/config/flavor.dart';
import 'themes/themes/colors.dart';

void mainCommon(FlavorConfig flavor) {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator(flavor);

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
