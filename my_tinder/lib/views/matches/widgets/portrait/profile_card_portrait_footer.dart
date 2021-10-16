import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_tinder/constants/matches.dart';
import 'package:my_tinder/shared/widgets/button.dart';
import 'package:my_tinder/themes/app_theme.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProfileCardPortraitFooter extends StatefulWidget {
  final Match profile;
  final int index;
  final AutoScrollController controller;

  const ProfileCardPortraitFooter(
      {Key? key,
      required this.profile,
      required this.index,
      required this.controller})
      : super(key: key);

  @override
  State<ProfileCardPortraitFooter> createState() =>
      _ProfileCardPortraitFooterState();
}

class _ProfileCardPortraitFooterState extends State<ProfileCardPortraitFooter> {
  late MatchButton skipButton;
  late MatchButton likeButton;

  @override
  void initState() {
    super.initState();

    // Initialise buttons
    skipButton = MatchButton(const Icon(Icons.close, color: Colors.black),
        SystemSoundType.alert, widget.controller, widget.index, () => {});
    likeButton = MatchButton(
        Icon(Icons.favorite_outline, size: 25, color: AppTheme.colors.primary),
        SystemSoundType.alert,
        widget.controller,
        widget.index,
        () => {});
  }

  Widget buildMatchButton(MatchButton button) => button.buildButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 7),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfileDescription(
                  name: widget.profile.name,
                  age: widget.profile.age,
                  description: widget.profile.bio),
              buildChoiceRow(index: widget.index),
            ],
          ),
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

  Widget buildChoiceRow({required index}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildMatchButton(skipButton),
          buildMatchButton(likeButton),
        ],
      );
}
