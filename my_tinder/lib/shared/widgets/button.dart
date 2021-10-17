import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_tinder/themes/app_theme.dart';
import 'package:my_tinder/models/profile.dart';
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

  VoidCallback? onClick;

  AutoScrollController controller;
  int index;

  MatchButton(this.icon, this.sound, this.controller, this.index,
      [this.onClick]);

  @override
  void onPress() {
    if (onClick != null) {
      onClick!();
    }
    _scrollToIndex();
    SystemSound.play(sound);
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


class ReturnButton implements Button {
    @override
  Icon icon;

  @override
  SystemSoundType sound;

  BuildContext context;
  ReturnButton(this.icon, this.sound, this.context);

  @override
  void onPress() {
    Navigator.pop(context);
  }
    @override
  Widget buildButton() => FloatingActionButton(
        onPressed: onPress,
        child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppTheme.colors.primary,
                  AppTheme.colors.secondary,
                ],
              ),
            ),
            child: icon),
        backgroundColor: Colors.white,
      );

}
class EditButton implements Button {
  @override
  Icon icon;

  @override
  SystemSoundType sound;

  BuildContext context;
  ValueNotifier<ProfileModel?> profile;

  EditButton(this.icon, this.sound, this.context, this.profile);

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
      MaterialPageRoute(builder: (context) => ProfileEdit(profile: profile)),
    );
  }
}

class SettingsButton implements Button {
  @override
  Icon icon;

  @override
  SystemSoundType sound;

  BuildContext context;

  ValueNotifier<ProfileModel?> profile;

  SettingsButton(this.icon, this.sound, this.context, this.profile);

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
      MaterialPageRoute(builder: (context) => Settings(profile: profile)),
    );
  }
}

class PhotoButton implements Button {
  @override
  Icon icon;

  @override
  SystemSoundType sound;

  Function onPressed;

  PhotoButton(this.icon, this.sound, this.onPressed);


  @override
  Widget buildButton() => Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          color: AppTheme.colors.primary,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    ),
  );

  @override
  void onPress() {
    onPressed();
  }

}
