import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';
import 'package:my_tinder/views/profile_details/widgets/profile_description.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProfileDetails extends StatelessWidget {
  final int index;
  final AutoScrollController controller;

  const ProfileDetails({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: ProfileDescription(
          index: index,
          controller: controller,
        ),
      ),
    );
  }
}
