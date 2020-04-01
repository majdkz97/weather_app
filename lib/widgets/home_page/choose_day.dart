import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/animator.dart';
import 'day_item.dart';

class ChooseDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            WidgetAnimator(
              fromLeft: true,fromTop: false,delay: 300,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 8),
                child: Text('Choose a day',
                style: TextStyle(
                  fontSize: 26
                ),
                ),
              ),
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 60,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10),
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft
                        , child: DayItem(dateTime: DateTime.now().add(Duration(days: 0)),),
                      ),
                      Align(
                        alignment: Alignment.center
                        , child: DayItem(dateTime: DateTime.now().add(Duration(days: 1)),),
                      ),
                      Align(
                        alignment: Alignment.centerRight
                        , child: DayItem(dateTime: DateTime.now().add(Duration(days: 2)),),
                      )
                    ],
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
}
