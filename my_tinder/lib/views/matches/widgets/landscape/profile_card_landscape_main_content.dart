import 'package:flutter/material.dart';
import 'package:my_tinder/constants/matches.dart';
import 'package:my_tinder/views/matches/widgets/landscape/profile_card_landscape_header.dart';

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
            ],
          ),
        ),
      ),
      flex: 1,
    );
  }

}
