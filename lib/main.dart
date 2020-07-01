import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:boxgame/box-game.dart';

void main() {
  // Make instance of Game class
  BoxGame game = BoxGame();
  runApp(game.widget);

  // Set Game Utility Settings
  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);
}