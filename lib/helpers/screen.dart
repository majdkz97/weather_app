import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen {
  final BuildContext context;

  Screen(this.context);

  double height() => MediaQuery.of(context).size.height;

  double width() => MediaQuery.of(context).size.width;

  double statusBar() => MediaQuery.of(context).padding.top;

  double heightWithoutStatusBar() =>
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  double heightWithoutStatusBarAndAppBar() =>
      MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      kToolbarHeight;
}
