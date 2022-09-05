import 'package:solid_domain/solid_domain.dart';
import 'package:solid_principle_app/main.dart';

void main() {
  mainCommon(
    FlavorConfig(
      env: Env.PRODUCTION,
      values: EnvValues(
        appVersion: '0.0.1',
        baseApi: 'https://jsonplaceholder.typicode.com/',
        debug: true,
        delay: 0,
        printResponse: false,
      ),
    ),
  );
}
