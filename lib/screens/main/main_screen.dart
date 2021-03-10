import 'package:flutter/material.dart';
import 'package:symptoms_monitor/screens/main/front_screen.dart';
import 'package:symptoms_monitor/screens/main/side_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _canBeDragged;
  double minDragStartEdge;
  double maxDragStartEdge;
  double maxSlide;
  @override
  void initState() {
    _canBeDragged = false;
    minDragStartEdge = 500.0;
    maxDragStartEdge = 50.0;
    maxSlide = 190.0;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    super.initState();
  }

  void turnOnAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    void _dragStarts(DragStartDetails details) {
      bool isDragOpenFromLeft = _animationController.isDismissed &&
          details.globalPosition.dx < minDragStartEdge;

      bool isDragOpenFromRight = _animationController.isCompleted &&
          details.globalPosition.dx > maxDragStartEdge;

      _canBeDragged = isDragOpenFromLeft || isDragOpenFromRight;
    }

    void _dragUpdates(DragUpdateDetails details) {
      if (_canBeDragged) {
        double delta = details.primaryDelta / maxSlide;
        _animationController.value += delta;
      }
    }

    void _dragEnds(DragEndDetails details) {
      if (_animationController.isDismissed ||
          _animationController.isCompleted) {
        return;
      }
      if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
        double visualVelocity = details.velocity.pixelsPerSecond.dx / _width;
        _animationController.fling(velocity: visualVelocity);
      } else if (_animationController.value < 0.5) {
        _animationController.stop();
      } else {
        _animationController.forward();
      }
    }

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onHorizontalDragStart: _dragStarts,
          onHorizontalDragUpdate: _dragUpdates,
          onHorizontalDragEnd: _dragEnds,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              double slide = maxSlide * _animationController.value;
              double scale = 1 - (0.3 * _animationController.value);
              return Stack(
                children: [
                  SideMenu(),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    alignment: Alignment.centerLeft,
                    child: FrontScreen(
                      startAnim: turnOnAnimation,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
