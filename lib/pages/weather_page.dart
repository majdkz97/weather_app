import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc/bloc.dart';
import 'package:weatherapp/blocs/weather_bloc/weather_bloc.dart';
import 'package:weatherapp/helpers/screen.dart';
import 'package:weatherapp/widgets/animator.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String text = 'Weather Screen';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc()
          ..add(FetchWeather(dateTime: DateTime.now().add(Duration(days: 2)))),
        child: WeatherPageBuilder(),
      ),
    );
  }
}

class WeatherPageBuilder extends StatefulWidget {
  @override
  _WeatherPageBuilderState createState() => _WeatherPageBuilderState();
}

class _WeatherPageBuilderState extends State<WeatherPageBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: BlocProvider.of<WeatherBloc>(context),
      builder: (context, state) {
        if (state is WeatherIsLoadingState)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (state is WeatherIsLoadedState)
          return Container(
            color: Theme.of(context).colorScheme.onSecondary,
            padding: EdgeInsets.symmetric(vertical: Screen(context).statusBar()),
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  flex: 30,
                  child: WidgetAnimator(
                    fromTop: false,fromLeft: true,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          state.dailyForecasts.hourlyForecasts[4].status,
                        style: TextStyle(
                          fontSize: 42,fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                  ),
                )
                ,Flexible(
                  flex: 60,
                  fit: FlexFit.tight,
                  child: WidgetAnimator(
                    fromLeft: true,  fromTop: true,delay: 200,time: 400,
                    child: Container(
                      child: FlareActor(
                        'assets/weather_conditions.flr',
                        alignment: Alignment.topCenter,
                        animation: '${state.dailyForecasts.hourlyForecasts[4].icon}',
                      ),
                    ),
                  ),
                ),

                Flexible(
                  flex: 25,
                  child: WidgetAnimator(
                    fromLeft: false,fromTop: false,
                    delay: 300,
                    child: Flex(direction: Axis.vertical,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 10,
                        child: Padding(
                          padding:  EdgeInsets.only(right: Screen(context).width()*0.55),
                          child: Container(
                            alignment: Alignment.bottomCenter,

                            child: Text('Dubai',
                              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),

                      ),

                      Flexible(
                        fit: FlexFit.tight,
                        flex: 15,
                        child: Container(
                          width: Screen(context).width(),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: <Widget>[
                              Container(
                                width: Screen(context).width()*0.45,
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child:Text('${state.dailyForecasts.hourlyForecasts.first.temperature}°',
                                  style: TextStyle(fontSize: 70,fontWeight: FontWeight.w700),

                                ),
                              ),
                              Container(
                                  width: Screen(context).width()*0.3,
                                  padding: EdgeInsets.all(5),
                                  child: Card(
                                    color: Colors.grey[100],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Flex(direction: Axis.vertical,
                                      children: <Widget>[
                                        Flexible(
                                          flex: 4,
                                          child: Container(
                                            alignment: Alignment.bottomLeft,
                                            child: Text('Wind',
                                              style: TextStyle(
                                                  color: Colors.black.withOpacity(0.6),
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 6,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text('9 km/h',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                fontSize: 20
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                      ),
                                    ),
                                  )
                              )
,                                                           Container(
                                  width: Screen(context).width()*0.3,
                                  padding: EdgeInsets.all(5),
                                  child: Card(
                                    color: Colors.grey[100],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Flex(direction: Axis.vertical,
                                        children: <Widget>[
                                          Flexible(
                                            flex: 4,
                                            child: Container(
                                              alignment: Alignment.bottomLeft,
                                              child: Text('Wind',
                                                style: TextStyle(
                                                    color: Colors.black.withOpacity(0.6),
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 6,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text('9 km/h',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              )


                            ],
                          ),
                        ),
                      ),
                    ],
                    ),
                  ),
                ),

                Spacer(flex: 5,)
              ],
            ),
          );
        else if (state is WeatherIsLoadErrorState)
          return Center(
            child: RaisedButton(
                onPressed: () {
                  BlocProvider.of<WeatherBloc>(context)
                    ..add(FetchWeather(
                        dateTime: DateTime.now().add(Duration(days: 1))));
                },
                child: Text('Error')),
          );
        else
          return Container();
      },
    );
  }
}
