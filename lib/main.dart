import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mvvm_flutter_masterclass/domain/di/di.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/routes_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModules();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Mvvm',
      debugShowCheckedModeBanner: false,
      initialRoute: ConstantsRoutes.splashRoute,
      getPages: Routes().getPageList,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: getApplicationTheme().appBarTheme),
    );
  }
}
