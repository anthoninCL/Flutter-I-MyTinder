import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_tinder/themes/app_theme.dart';
import 'package:my_tinder/views/profile_details/widgets/lifestyles.dart';
import 'package:my_tinder/views/profile_details/widgets/localization.dart';
import 'package:my_tinder/shared/widgets/button.dart';
import 'package:flutter/services.dart';
import 'package:my_tinder/views/profile_details/widgets/profile_pictures_list.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:my_tinder/constants/matches.dart';

const profilePictures = [
  "assets/images/profile_pic_5.jpg",
  "assets/images/profile_pic_6.jpg",
  "assets/images/profile_pic_8.jpg",
  "assets/images/profile_pic_9.jpg",
  "assets/images/profile_pic_10.jpg",
];

class ProfileDescription extends StatefulWidget {
  final int index;
  final AutoScrollController controller;
  final Match profile;

  @override
  State<ProfileDescription> createState() => _ProfileDescription();

  const ProfileDescription({
    Key? key,
    required this.controller,
    required this.index,
    required this.profile,
  }) : super(key: key);
}

class _ProfileDescription extends State<ProfileDescription> {
  late MatchButton skipButton;
  late MatchButton likeButton;

  @override
  void initState() {
    super.initState();

    // Initialise buttons
    skipButton = MatchButton(
        const Icon(Icons.close, color: Colors.black),
        SystemSoundType.alert,
        widget.controller,
        widget.index,
        () => Navigator.pop(context));
    likeButton = MatchButton(
        Icon(Icons.favorite_outline, size: 25, color: AppTheme.colors.primary),
        SystemSoundType.alert,
        widget.controller,
        widget.index,
        () => Navigator.pop(context));
  }

  Widget buildMatchButton(MatchButton button) => button.buildButton();
  Widget buildReturnButton(ReturnButton button) => button.buildButton();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    widget.profile.images[0],
                    width: double.infinity,
                    height: 375,
                    fit: BoxFit.cover,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.only(right: 20, top: 345),
                        child: buildReturnButton(ReturnButton(
                            const Icon(Icons.undo,
                                color: Colors.white, size: 25),
                            SystemSoundType.alert,
                            context)),
                      )),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.profile.name,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.profile.age.toString(),
                          style: const TextStyle(fontSize: 27),
                        ),
                      ],
                    ),
                    Localization(
                      location: widget.profile.city,
                      distance: widget.profile.distance,
                    ),
                    UserLifeStyles(
                      lifeStyleArray: widget.profile.lifestyles,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: const Divider(),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: UserLifeStyles(lifeStyleArray: widget.profile.interests),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Divider(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.profile.bio,
                  style: TextStyle(fontSize: 16, color: AppTheme.colors.grey),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: const Divider(),
              ),
              ProfilePicturesList(
                  images: List.from(widget.profile.images)..removeAt(0)),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(bottom: 80),
            child: buildChoiceRow(index: widget.index),
          ),
        ),
      ],
    );
  }

  Widget buildChoiceRow({required index}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildMatchButton(skipButton),
          buildMatchButton(likeButton),
        ],
      );
}
