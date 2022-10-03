import 'package:solid_principle_app/main.dart';
import 'core/config/flavor.dart';

void main() {
  mainCommon(
    FlavorConfig.init(
      env: Env.DEV,
      values: EnvValues(
        appVersion: '0.0.1',
        baseApi: 'https://jsonplaceholder.typicode.com/',
        debug: false,
        delay: 3000,
        printResponse: true,
      ),
    ),
  );
}
