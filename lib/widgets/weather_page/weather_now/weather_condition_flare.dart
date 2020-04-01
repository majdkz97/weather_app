import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../../animator.dart';

Widget weatherConditionFlare({String icon}){
  return Flexible(
    flex: 60,
    fit: FlexFit.tight,
    child: WidgetAnimator(
      fromLeft: true,  fromTop: true,delay: 200,time: 400,
      child: Container(
        child: FlareActor(
          'assets/weather_conditions.flr',
          alignment: Alignment.topCenter,
          animation: '$icon',
        ),
      ),
    ),
  );
}