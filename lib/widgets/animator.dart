import 'dart:async';

import 'package:flutter/material.dart';

class Animator extends StatefulWidget {
  final Widget child;
  final Duration time;
  final bool fromTop;
  final int duration;
  final bool fromLeft;

  Animator({this.child, this.time, this.fromTop,this.duration,this.fromLeft});
  @override
  _AnimatorState createState() => _AnimatorState();
}

class _AnimatorState extends State<Animator>
    with SingleTickerProviderStateMixin {
  Timer timer;
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: widget.duration), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    timer = Timer(widget.time, animationController.forward);
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: widget.fromTop
                ? Offset(0.0, (1 - animation.value) * 60)
                : Offset((widget.fromLeft?(-1):(1))*(1 - animation.value) * 60, 0.0),
            child: child,
          ),
        );
      },
    );
  }
}

Timer timer;
Duration duration = Duration();
wait(int delay) {
  if (timer == null || !timer.isActive) {
    timer = Timer(Duration(microseconds: 120), () {
      duration = Duration();
    });
  }
  duration += Duration(milliseconds: delay);
  return duration;
}

class WidgetAnimator extends StatelessWidget {
  final Widget child;
  final bool fromTop;
  final bool fromLeft;
  final int delay;
  final int time;
  const WidgetAnimator({Key key, this.child, @required this.fromTop,@required this.fromLeft,this.delay = 120,this.time=300})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Animator(child: child,time: wait(delay),fromTop: fromTop,duration: time,fromLeft: fromLeft);
  }
}
