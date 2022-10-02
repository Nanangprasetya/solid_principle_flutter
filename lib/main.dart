import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:solid_principle_app/hive_helper/register_adapters.dart';
import 'package:solid_principle_app/injections.dart';
import 'presentation/routes/routes.dart';
import 'core/core.dart';

void mainCommon(FlavorConfig flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  // injections
  initLocator(flavor);

  // Hive Init
  await Hive.initFlutter();

  // Hive Adapter Register
  registerAdapters();

  //! WARNING: This line below will delete hive data
  // await Hive.deleteBoxFromDisk(BOX_ARTICLE);

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
      initialRoute: AppRoutes.home,
      getPages: AppPages.pageRoute,
    );
  }
}
