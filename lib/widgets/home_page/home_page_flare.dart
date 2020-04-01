import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

Widget homePageFlare()
{
  return Flexible(
    flex: 40,
    fit: FlexFit.tight,
    child: FlareActor('assets/home_page.flr',fit: BoxFit.cover,animation: 'start',),
  );
}
