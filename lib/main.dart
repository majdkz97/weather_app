import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/routes.dart';
import 'package:weatherapp/themes/app_theme.dart';

import 'blocs/SimpleBloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.splashScreenRoute,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,

    );
  }
}
