import 'package:flutter/material.dart';

class NavigatorBackButton extends StatelessWidget {
  final String from;
  final String to;

  const NavigatorBackButton({Key key, this.from, this.to}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        onPressed: (){
          Navigator.pop(context);
          print('Pop Route: $from');
          print('Current Route: $to');
        });
  }
}
