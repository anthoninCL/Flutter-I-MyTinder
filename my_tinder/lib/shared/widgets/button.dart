import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class Button {
  late SystemSoundType sound;
  late IconData icon;

  void onPress();

  Widget buildButton();
}
