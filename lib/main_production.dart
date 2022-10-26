import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:solid_data/solid_data.dart';
import 'package:solid_principle_app/main.dart';

Future<void> main() async {
  // Load Env with flavor name
  await dotenv.load(fileName: ".env.production");
  
  mainCommon(FlavorConfig.init(
    env: Env.PRODUCTION,
    values: EnvValues(
      appVersion: '0.0.1',
      baseApi: dotenv.env['BASE_API'],
      debug: true,
      delay: 0,
      printResponse: false,
      urlGithub: dotenv.env['URL_GITHUB'],
    ),
  ));
}
