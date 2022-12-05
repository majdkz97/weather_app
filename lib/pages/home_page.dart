import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/theme_bloc/theme_bloc.dart';
import 'package:weatherapp/helpers/data_helper.dart';
import 'package:weatherapp/repositories/storage_service.dart';
import 'package:weatherapp/themes/app_theme.dart';
import 'package:weatherapp/widgets/home_page/choose_day.dart';
import 'package:weatherapp/widgets/home_page/home_page_flare.dart';
import 'package:weatherapp/widgets/home_page/select_city.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {

  void changeTheme(){
    if(DataHelper.selectedTheme == AppThemes.lightMode) {
      BlocProvider.of<ThemeBloc>(context).add(
          ChangeAppTheme(theme: AppThemes.darkMode));
      DataHelper.selectedTheme = AppThemes.darkMode;
    }
    else
    {
      BlocProvider.of<ThemeBloc>(context).add(
          ChangeAppTheme(theme: AppThemes.lightMode));
      DataHelper.selectedTheme = AppThemes.lightMode;
    }
    StorageService().write('AppTheme', DataHelper.selectedTheme == AppThemes.darkMode?'dark':'light');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness brightness =
        WidgetsBinding.instance.window.platformBrightness;
    DataHelper.selectedTheme = Brightness.dark==brightness?AppThemes.lightMode:AppThemes.darkMode;
    changeTheme();
    //inform listeners and rebuild widget tree
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: changeTheme,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      child: Icon(Icons.brightness_2,color:Theme.of(context).colorScheme.onBackground,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Flex(direction: Axis.vertical,
      children: <Widget>[
        homePageFlare(),
        Flexible(
          flex: 60,
          fit: FlexFit.tight,
          child: Container(
            child: Flex(direction: Axis.vertical,
            children: <Widget>[
              SelectCity(),
              ChooseDay()
            ],
            ),
          ),
        )

      ],
      ),
    );
  }
}

