import 'package:flutter/material.dart';
import 'package:weatherapp/repositories/storage_service.dart';

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
            onTap: () async {
             await StorageService().clear();
              Navigator.pushNamed(context, Router.weatherRoute);
            },
            child: Text('Home Screen')),
      ),
    );
  }
}
