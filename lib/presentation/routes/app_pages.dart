import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as getTrans;
import '../pages/page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static List<GetPage<dynamic>> get pageRoute => [
        GetPage(
          name: _Routes.home,
          page: () => MainPage(),
          transition: getTrans.Transition.rightToLeft,
        ),
      ];
}
