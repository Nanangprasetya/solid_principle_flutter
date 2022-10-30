import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_principle_app/core/themes/app_theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:solid_principle_app/injections.dart';
import 'presentation/routes/routes.dart';
import 'package:solid_data/solid_data.dart';
import 'package:hive_flutter/adapters.dart';


void mainCommon(FlavorConfig flavor) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Keep native splash screen up until app is finished bootstrapping
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // injections locator
  initLocator(flavor);

  // Hive Init
  await Hive.initFlutter();

  // Hive Adapter Register
  registerAdapters();

  // Start App
  runApp(const App());

  // Remove splash screen when bootstrap is complete
  FlutterNativeSplash.remove();
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
