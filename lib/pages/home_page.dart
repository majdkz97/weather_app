import 'package:flutter/material.dart';

import '../routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Router.weatherRoute);
            },
            child: Text('Home Screen')),
      ),
    );
  }
}
