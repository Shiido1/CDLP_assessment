import 'package:assessment/core/core_folder/app/app.router.dart';
import 'package:assessment/core/core_folder/manager/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/core_folder/app/app.locator.dart';

final navigate = locator<NavigationService>();

// final session = locator<SharedPreferencesService>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Lock orientation early
  setupLocator();
  await locator<SharedPreferencesService>().initilize();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: SharedPreferencesService.instance.isLogin
          ? Routes.dashoardScreen
          : Routes.myHomePage,
    );
  }
}
