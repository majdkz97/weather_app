import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/animator.dart';

Widget weatherStatus({String status}){
  return Flexible(
    fit: FlexFit.tight,
    flex: 30,
    child: WidgetAnimator(
      fromTop: false,fromLeft: true,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
           status,
          style: TextStyle(
              fontSize: 42,fontWeight: FontWeight.w300
          ),
        ),
      ),
    ),
  );
}