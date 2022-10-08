import 'package:solid_principle_app/main.dart';
import 'core/config/flavor.dart';

void main() {
  mainCommon(FlavorConfig.init(
    env: Env.PRODUCTION,
    values: EnvValues(
      appVersion: '0.0.1',
      baseApi: 'https://jsonplaceholder.typicode.com/',
      debug: true,
      delay: 0,
      printResponse: false,
      urlGithub: 'https://github.com/Nanangprasetya/solid_principle_flutter/',
    ),
  ));
}
