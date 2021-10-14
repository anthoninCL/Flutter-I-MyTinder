import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_tinder/Models/profile.dart';
import 'package:my_tinder/shared/widgets/button.dart';
import 'package:my_tinder/themes/app_theme.dart';

class ProfilePortraitFooter extends StatefulWidget {
  final ProfileModel profile;

  const ProfilePortraitFooter(
      {Key? key,
        required this.profile,})
      : super(key: key);

  @override
  State<ProfilePortraitFooter> createState() => _ProfilePortraitFooterState();
}

class _ProfilePortraitFooterState extends State<ProfilePortraitFooter> {

  late EditButton editButton;
  late SettingsButton settingsButton;

  @override
  void initState() {
    super.initState();

    // Initialise buttons
  }

  Widget buildButton(Button button) => button.buildButton();

  @override
  Widget build(BuildContext context) {
    editButton = EditButton(Icon(Icons.edit, size: 25, color: AppTheme.colors.grey,), SystemSoundType.click, context);
    settingsButton = SettingsButton(Icon(Icons.settings, size: 25, color: AppTheme.colors.grey,), SystemSoundType.click, context);
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 7),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProfileDescription(
                name: widget.profile.username,
                age: widget.profile.age,
                description: widget.profile.bio),
            buildChoiceRow(),
          ],
        ),
      ),
    );
  }

  Widget buildProfileDescription(
      {required String name,
        required num age,
        required String description}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name + ", " + age.toString(),
            style: const TextStyle(
                fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 20),
        ],
      );

  Widget buildChoiceRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      buildButton(settingsButton),
      buildButton(editButton),
    ],
  );
}