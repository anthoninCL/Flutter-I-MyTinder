import 'package:flutter/material.dart';
import 'package:my_tinder/constants/matches.dart';
import 'package:my_tinder/themes/app_theme.dart';
import 'package:my_tinder/views/matches/widgets/landscape/profile_card_landscape_header.dart';
import 'package:my_tinder/views/profile_details/widgets/lifestyles.dart';

class ProfileCardLandscapeMainContent extends StatelessWidget {
  final Match profile;

  const ProfileCardLandscapeMainContent({Key? key, required this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ProfileCardLandscapeHeader(
                    name: profile.name,
                    age: profile.age,
                    city: profile.city,
                    distance: profile.distance),
              ),
              UserLifeStyles(
                lifeStyleArray: profile.lifestyles,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Divider(),
              ),
              UserLifeStyles(lifeStyleArray: profile.interests),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  profile.bio,
                  style: TextStyle(fontSize: 16, color: AppTheme.colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
      flex: 1,
    );
  }
}
