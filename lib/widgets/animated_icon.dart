import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IconAnimated extends StatefulWidget {
  const IconAnimated({Key? key}) : super(key: key);

  @override
  _IconAnimatedState createState() => _IconAnimatedState();
}

class _IconAnimatedState extends State<IconAnimated>
    with SingleTickerProviderStateMixin {
  // create animation controller
  late AnimationController _animationController;

  // initialise animation controller
  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  // method for when user taps icon
  bool currentlyPlaying = false;
  void _iconTapped() {
    if (currentlyPlaying == false) {
      currentlyPlaying = true;
      _animationController.forward();
    } else {
      currentlyPlaying = false;
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _iconTapped,
      child: AnimatedIcon(
        progress: _animationController,
        icon: AnimatedIcons.add_event,
        size: 3.h,
      ),
    );
    
  }
}
