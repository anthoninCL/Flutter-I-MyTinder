import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_tinder/views/profile_edit/profile_edit.dart';
import 'package:my_tinder/views/settings/settings.dart';
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
        heroTag: "MatchButton",
        onPressed: onPress,
        child: icon,
        backgroundColor: Colors.white,
      );
}

class EditButton implements Button {
  @override
  Icon icon;

  @override
  SystemSoundType sound;

  BuildContext context;

  EditButton(this.icon, this.sound, this.context);

  @override
  Widget buildButton() => FloatingActionButton(
        heroTag: "EditButton",
        onPressed: onPress,
        child: icon,
        backgroundColor: Colors.white,
      );

  @override
  void onPress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileEdit()),
    );
  }
}

class SettingsButton implements Button {
  @override
  Icon icon;

  @override
  SystemSoundType sound;

  BuildContext context;

  SettingsButton(this.icon, this.sound, this.context);

  @override
  Widget buildButton() => FloatingActionButton(
        heroTag: "SettingsButton",
        onPressed: onPress,
        child: icon,
        backgroundColor: Colors.white,
      );

  @override
  void onPress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Settings()),
    );
  }
}
