import 'package:flutter/material.dart';
import 'package:my_tinder/views/matches/widgets/portrait/profile_card_portrait_footer.dart';
import 'package:my_tinder/views/matches/widgets/portrait/profile_card_portrait_header.dart';
import 'package:my_tinder/constants/matches.dart';
import 'package:my_tinder/views/profile_details/profile_details.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileDetails(
                    index: index,
                    controller: controller,
                  )),
        );
      },
      child: FittedBox(
        fit: BoxFit.fill,
        child: Stack(
          children: [
            Image.asset(
              profile.images[0],
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ProfileCardPortraitHeader(
                    profile: profile,
                  ),
                  const Spacer(),
                  ProfileCardPortraitFooter(
                    profile: profile,
                    index: index,
                    controller: controller,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
