import 'package:flutter/material.dart';
import 'package:my_tinder/models/profile.dart';
import 'package:my_tinder/themes/app_theme.dart';
import 'package:my_tinder/views/profile_details/widgets/profile_description.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:my_tinder/constants/matches.dart';

class ProfileDetails extends StatelessWidget {
  final int index;
  final AutoScrollController? controller;
  final Match profile;

  const ProfileDetails({
    Key? key,
    required this.index,
    this.controller,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: ProfileDescription(
          index: index,
          controller: controller,
          profile: profile,
        ),
      ),
    );
  }
}
