import 'package:flutter/material.dart';
import 'package:my_tinder/Views/matches/widgets/profile_card_footer.dart';
import 'package:my_tinder/Views/matches/widgets/profile_card_header.dart';
import 'package:my_tinder/constants/matches.dart';

class ProfileCard extends StatelessWidget {
  final Match profile;
  final index;
  final controller;

  const ProfileCard(
      {Key? key,
      required this.profile,
      required this.index,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.fill,
        child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          Image.asset(
            profile.images[0],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            height: MediaQuery.of(context).size.height - 40,
            child: Column(
              children: [
                ProfileCardHeader(profile: profile,),
                const Spacer(),
                ProfileCardFooter(
                  profile: profile,
                  index: null,
                  controller: controller,
                )
              ],
            ),
          )
        ]));
  }
}
