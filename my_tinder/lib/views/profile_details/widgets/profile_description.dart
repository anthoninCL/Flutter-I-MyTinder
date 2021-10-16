import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_tinder/themes/app_theme.dart';
import 'package:my_tinder/views/profile_details/widgets/lifestyles.dart';
import 'package:my_tinder/views/profile_details/widgets/localization.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_tinder/shared/widgets/button.dart';
import 'package:flutter/services.dart';

class LifeStyle {
  final String name;
  final String value;
  final IconData? icon;
  final bool isSelected;
  const LifeStyle(this.name, this.value,
      [this.isSelected = false, this.icon = MdiIcons.nullIcon]);
}

const tmpLifeStyles = [
  LifeStyle("Astrological Sign", "Gemini", false, MdiIcons.weatherNight),
  LifeStyle("Drink", "Bloody Mary", false, MdiIcons.glassCocktail),
  LifeStyle("Food", "Italian", false, MdiIcons.foodForkDrink),
  LifeStyle("Animals", "Cat", false, MdiIcons.paw),
  LifeStyle("Social Network", "Instagram", false, MdiIcons.web),
];

const tmpLifeStyles2 = [
  LifeStyle("Astrological Sign", "Travel", true),
  LifeStyle("Drink", "Globe-trotter", true),
  LifeStyle("Food", "Photo shooting"),
  LifeStyle("Animals", "Mode"),
  LifeStyle("Social Network", "Shopping"),
];

const profilePictures = [
  "assets/images/profile_pic_5.jpg",
  "assets/images/profile_pic_6.jpg",
  "assets/images/profile_pic_8.jpg",
  "assets/images/profile_pic_9.jpg",
  "assets/images/profile_pic_10.jpg",
];

class ProfileDescription extends StatefulWidget {
  @override
  State<ProfileDescription> createState() => _ProfileDescription();

  const ProfileDescription({Key? key}) : super(key: key);
}

class _ProfileDescription extends State<ProfileDescription> {
  late MatchButton skipButton;
  late MatchButton likeButton;

  @override
  void initState() {
    super.initState();

    // Initialise buttons
    skipButton = MatchButton(const Icon(Icons.close, color: Colors.black),
        SystemSoundType.alert, widget.controller, 5);
    likeButton = MatchButton(
        Icon(Icons.favorite_outline, size: 25, color: AppTheme.colors.primary),
        SystemSoundType.alert,
        widget.controller,
        5);
  }

  Widget buildMatchButton(MatchButton button) => button.buildButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/image 1.png',
            width: double.infinity,
            height: 375,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter),
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
          ),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Anne Laure",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "25",
                    style: TextStyle(fontSize: 27),
                  ),
                ],
              ),
              const Localization(
                location: "Tour Eiffel",
                distance: "2km",
              ),
              const UserLifeStyles(
                lifeStyleArray: tmpLifeStyles,
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
          child: const UserLifeStyles(lifeStyleArray: tmpLifeStyles2),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: const Divider(),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Travel 🛫 Sport and food, Only God can judge me...",
            style: TextStyle(fontSize: 16, color: AppTheme.colors.grey),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: const Divider(),
        ),
        Wrap(
          runSpacing: 4,
          spacing: 2,
          children: profilePictures.map((picture) {
            return Image.asset(
              picture,
              width: 125,
              height: 125,
              fit: BoxFit.cover,
            );
          }).toList(),
        ),
        buildChoiceRow(index: 5),
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
