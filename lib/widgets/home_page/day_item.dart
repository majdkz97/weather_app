import 'package:flutter/material.dart';
import 'package:weatherapp/helpers/date_converters.dart';
import 'package:weatherapp/helpers/screen.dart';
import 'package:weatherapp/widgets/animator.dart';
import '../../routes.dart';


class DayItem extends StatelessWidget {
  final DateTime dateTime;
  const DayItem({Key key, this.dateTime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen(context).width()*0.6,

      padding: const EdgeInsets.all(8.0),
      child: WidgetAnimator(
        fromLeft: true,fromTop: false,delay: 300,

        child: RaisedButton(onPressed: () async {
         // await StorageService().clear();
          Navigator.pushNamed(context, AppRouter.weatherRoute,arguments: dateTime);
        },
          color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${datetimeToNamedDay(dateTime)}',
                      style: TextStyle(
                          fontSize: 22,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                    TextSpan(
                        text: '\n'
                    ),
                    TextSpan(
                        text: '${dateTimeToString(dateTime)}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.onSecondary
                      ),
                    ),

                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
