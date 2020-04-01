import 'package:flutter/material.dart';
import 'package:weatherapp/helpers/date_converters.dart';
import 'package:weatherapp/widgets/animator.dart';

Widget weatherDate({DateTime dateTime}){
  return Flexible(
    fit: FlexFit.tight,
    flex: 30,
    child: WidgetAnimator(
      fromTop: false,fromLeft: true,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:  RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              children: [
                TextSpan(
                  text: '${datetimeToNamedDay(dateTime)}',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300
                  ),
                ),
                TextSpan(
                    text: '\n'
                ),
                TextSpan(
                  text: '${dateTimeToString(dateTime)}',
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                   ),
                ),

              ]
          ),
        ),
      ),
    ),
  );
}