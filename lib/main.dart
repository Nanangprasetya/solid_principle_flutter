import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_principle_app/core/themes/app_theme.dart';
import 'package:solid_principle_app/injections.dart';
import 'presentation/routes/routes.dart';
import 'package:solid_data/solid_data.dart';
import 'package:hive_flutter/adapters.dart';


void mainCommon(FlavorConfig flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  // injections
  initLocator(flavor);

  // Hive Init
  await Hive.initFlutter();

  // Hive Adapter Register
  registerAdapters();

  runApp(const Apps());
}

class Apps extends StatelessWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: !sl<FlavorConfig>().values!.debug!,
      title: 'Solid Principle',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      getPages: AppPages.pageRoute,
    );
  }
}
