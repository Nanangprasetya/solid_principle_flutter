import 'package:get_it/get_it.dart';
import 'package:solid_domain/solid_domain.dart';

import 'injector/injector.dart';
import 'service/service.dart';

class SolidDataApi {
 static void init({required FlavorConfig env, required GetIt getIt}) {
    configureDependencies(getIt);
    BaseApi(env);
  }
}
