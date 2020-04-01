import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/animator.dart';

Widget weatherProperty({String title,String description}){
  return  Container(
    padding: EdgeInsets.all(5),
    child: WidgetAnimator(
      fromLeft: true,
      fromTop: false,
      delay: 300,
      child: Card(
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flex(direction: Axis.vertical,
               crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(title,
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
                    child: Text(description,
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
        ),
    ),
  );
}