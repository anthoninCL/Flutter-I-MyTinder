import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

abstract class Button {
  late SystemSoundType sound;
  late Icon icon;

  void onPress();

  Widget buildButton();
}

class MatchButton implements Button {
  @override
  Icon icon;

  @override
  SystemSoundType sound;

  AutoScrollController controller;
  int index;

  MatchButton(this.icon, this.sound, this.controller, this.index);

  @override
  void onPress() {
    _scrollToIndex();
  }

  Future _scrollToIndex() async {
    await controller.scrollToIndex(index + 1,
        preferPosition: AutoScrollPosition.begin);
  }

  @override
  Widget buildButton() => FloatingActionButton(
        onPressed: onPress,
        child: icon,
        backgroundColor: Colors.white,
      );
}
