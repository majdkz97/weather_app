import 'package:flutter/material.dart';

Widget weatherTemperature({int temperature,double width}){
  return   Container(
    width: width,
    padding: EdgeInsets.all(5),
    alignment: Alignment.center,
    child:Text('$temperature°',
      style: TextStyle(fontSize: 70,fontWeight: FontWeight.w700),

    ),
  );
}