import 'package:flutter/material.dart';
import 'package:my_tinder/constants/matches.dart';

class ProfileCardLandscapeImagesList extends StatelessWidget {
  final Match profile;

  const ProfileCardLandscapeImagesList(
      {Key? key, required this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: SizedBox(
          width: 125,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
          ...List.generate(
          profile.images.length - 1,
                (index) =>
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Image.asset(
                    profile.images[index + 1], fit: BoxFit.cover,
                    height: 125,
                    width: 125,),
                ),
          )
      ],
    ),)
    ,
    );
  }
}
