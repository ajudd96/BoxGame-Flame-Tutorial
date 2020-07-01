import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';

// Main Game Class
class BoxGame extends Game with TapDetector {

  // Size of Screen 
  Size screenSize;

  // Win boolean
  bool hasWon = false;

  // Draws objects on screen.
  // Note: Draw bottom-most objects first (i.e. start with background).
  void render(Canvas canvas) {
    // Background
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    // Target Box
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(
      screenCenterX - 75, 
      screenCenterY - 75, 
      150, 
      150
    );
    Paint boxPaint = Paint();
    // Box green if won, else white
    boxPaint.color = hasWon ? Color(0xff00ff00) : Color(0xffffffff);
    canvas.drawRect(boxRect, boxPaint);
  }

  // Handles object movements and other items that require updating
  void update(double t) {
    // TODO: implement update
  }

  // Will resize Screen
  void resize(Size size) {
    screenSize = size;
    super.resize(size); // Can be called in render function
  }

  // Will be called when user taps on screen.
  // Will check if user taps in square
  @override
  void onTapDown(TapDownDetails d) {
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    hasWon = (d.globalPosition.dx >= screenCenterX - 75
      && d.globalPosition.dx <= screenCenterX + 75
      && d.globalPosition.dy >= screenCenterY - 75
      && d.globalPosition.dy <= screenCenterY + 75
    );
  }
}