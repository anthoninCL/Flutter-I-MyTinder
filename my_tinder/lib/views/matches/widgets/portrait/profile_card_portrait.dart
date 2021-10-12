import 'package:flutter/material.dart';
import 'package:my_tinder/views/matches/widgets/portrait/profile_card_portrait_footer.dart';
import 'package:my_tinder/views/matches/widgets/portrait/profile_card_portrait_header.dart';
import 'package:my_tinder/constants/matches.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProfileCardPortrait extends StatelessWidget {
  final Match profile;
  final int index;
  final AutoScrollController controller;

  const ProfileCardPortrait(
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
                ProfileCardPortraitHeader(profile: profile,),
                const Spacer(),
                ProfileCardPortraitFooter(
                  profile: profile,
                  index: index,
                  controller: controller,
                )
              ],
            ),
          )
        ]));
  }
}
