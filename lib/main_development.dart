import 'package:solid_principle_app/main.dart';
import 'package:solid_data/solid_data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  // Load Env with flavor name
  await dotenv.load(fileName: ".env.development");

  mainCommon(
    FlavorConfig.init(
      env: Env.DEVELOPMENT,
      values: EnvValues(
        appVersion: '0.0.1',
        baseApi: dotenv.env['BASE_API'],
        debug: false,
        delay: 3000,
        printResponse: true, 
        urlGithub: dotenv.env['URL_GITHUB'],
      ),
    ),
  );
}
