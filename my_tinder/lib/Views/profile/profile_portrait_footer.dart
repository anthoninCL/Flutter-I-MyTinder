import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_tinder/Models/profile.dart';
import 'package:my_tinder/shared/widgets/button.dart';
import 'package:my_tinder/themes/app_theme.dart';

class ProfilePortraitFooter extends StatefulWidget {
  ValueNotifier<ProfileModel?> profile;
  final Function showPicker;

  ProfilePortraitFooter({
    Key? key,
    required this.profile,
    required this.showPicker,
  }) : super(key: key);

  @override
  State<ProfilePortraitFooter> createState() => _ProfilePortraitFooterState();
}

class _ProfilePortraitFooterState extends State<ProfilePortraitFooter> {
  late EditButton editButton;
  late SettingsButton settingsButton;
  late PhotoButton photoButton;

  Widget buildButton(Button button) => button.buildButton();

  @override
  Widget build(BuildContext context) {
    photoButton = PhotoButton(
        Icon(
          Icons.photo_camera,
          size: 30,
          color: AppTheme.colors.white,
        ),
        SystemSoundType.click,
        () => widget.showPicker());
    editButton = EditButton(
        Icon(
          Icons.edit,
          size: 25,
          color: AppTheme.colors.grey,
        ),
        SystemSoundType.click,
        context,
        widget.profile);
    settingsButton = SettingsButton(
        Icon(
          Icons.settings,
          size: 25,
          color: AppTheme.colors.grey,
        ),
        SystemSoundType.click,
        context,
        widget.profile);

    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 8),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildProfileDescription(
                    name: widget.profile.value!.username,
                    age: widget.profile.value!.age,
                    description: widget.profile.value!.bio),
                buildChoiceRow(),
              ],
            )));
  }

  Widget buildProfileDescription(
          {required String name,
          required num age,
          required String description}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name + ", " + age.toString(),
              style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );

  Widget buildChoiceRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildButton(settingsButton),
          buildButton(photoButton),
          buildButton(editButton),
        ],
      );
}
