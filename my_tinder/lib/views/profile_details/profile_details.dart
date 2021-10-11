import 'package:flutter/material.dart';
import 'package:my_tinder/views/profile_details/widgets/profile_description.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      child: const ProfileDescription(),
    );
  }
}
