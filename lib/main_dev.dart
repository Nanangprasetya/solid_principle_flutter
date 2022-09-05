import 'package:solid_domain/solid_domain.dart';
import 'package:solid_principle_app/main.dart';

void main() {
  mainCommon(
    FlavorConfig(
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
