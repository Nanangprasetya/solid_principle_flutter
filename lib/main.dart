import 'package:flutter/material.dart';
import 'package:solid_data_api/solid_data_api.dart';
import 'package:solid_domain/solid_domain.dart';

import 'app/injector/injector.dart';

void mainCommon(FlavorConfig env) {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies(getIt);
  SolidDomain.init(getIt);
  SolidDataApi.init(env: env, getIt: getIt);

  runApp(const Apps());
}

class Apps extends StatelessWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Principle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Text(""),
    );
  }
}
