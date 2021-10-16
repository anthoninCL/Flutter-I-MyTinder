import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_tinder/models/profile.dart';
import 'package:my_tinder/themes/app_theme.dart';
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
    SystemSound.play(sound);
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

class TilesButton extends StatelessWidget implements Button {
  final Function setValue;
  final String title;
  final String value;
  IconData iconData;

  @override
  late SystemSoundType sound;

  @override
  late Icon icon;

  TilesButton(
  {
    required this.title,
    required this.value,
    required this.setValue,
    required this.iconData
  });

  @override
  Widget buildButton() => Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color:
              title == value ? AppTheme.colors.primary : AppTheme.colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconData != MdiIcons.nullIcon)
                Row(
                  children: [
                    Icon(
                      iconData,
                      color: title == value
                          ? AppTheme.colors.primary
                          : AppTheme.colors.grey,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              Text(
                title,
                style: TextStyle(
                    color: title == value
                        ? AppTheme.colors.primary
                        : AppTheme.colors.grey),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  @override
  void onPress() {
    setValue(title);
    print('onpress button title: $title');
  }

  @override
  Widget build(BuildContext context) {
    return buildButton();
  }

}