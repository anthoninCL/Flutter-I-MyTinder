import 'package:flutter/material.dart';
import 'package:my_tinder/constants/matches.dart';

class ProfileCardPortraitHeader extends StatelessWidget {
  final Match profile;

  const ProfileCardPortraitHeader({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              profile.city,
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Text(profile.distance,
                style: const TextStyle(fontSize: 18, color: Colors.white))
          ]),
        ),
      ),
    );
  }
}
