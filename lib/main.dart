import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/helpers/data_helper.dart';
import 'package:weatherapp/routes.dart';
import 'package:weatherapp/themes/app_theme.dart';
import 'package:window_size/window_size.dart' as window_size;
import 'blocs/theme_bloc/theme_bloc.dart';
import 'repositories/storage_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // BlocSupervisor.delegate = SimpleBlocDelegate();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
  ));


  if(!kIsWeb)
    if(Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      var window = await  window_size.getWindowInfo();
      if (window.screen != null) {
        final screenFrame = window.screen.visibleFrame;
        final width = (window.screen.visibleFrame.height*0.95) * (9.0/16.0);
        final height =(window.screen.visibleFrame.height*0.95);
        final left = ((screenFrame.width - width)).roundToDouble();
        final top = ((screenFrame.height - height) / 3).roundToDouble();
        final frame = Rect.fromLTWH(left, top, width, height);
        window_size.setWindowFrame(frame);
        window_size.setWindowMaxSize(Size(width, height));
        window_size.setWindowMinSize(Size(width, height));
      }
    }

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
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: AppRouter.splashScreenRoute,
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}


