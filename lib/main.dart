import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/helpers/data_helper.dart';
import 'package:weatherapp/routes.dart';
import 'package:weatherapp/themes/app_theme.dart';
import 'blocs/simple_bloc.dart';
import 'blocs/theme_bloc/theme_bloc.dart';
import 'repositories/storage_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  DataHelper.selectedTheme = (await StorageService().read('AppTheme'))=='light'?AppThemes.lightMode:AppThemes.darkMode;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (_) => ThemeBloc()..add(
          ChangeAppTheme(theme: DataHelper.selectedTheme)),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext ctx, ThemeState state) {
          return MaterialApp(
            title: 'Weather App',
            onGenerateRoute: Router.generateRoute,
            initialRoute: Router.splashScreenRoute,
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}


