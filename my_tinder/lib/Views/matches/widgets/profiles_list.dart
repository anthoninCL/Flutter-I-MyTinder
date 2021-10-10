import 'package:flutter/material.dart';
import 'package:my_tinder/Views/matches/widgets/profile_card.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProfileList extends StatelessWidget {
  final controller;

  const ProfileList({Key? key, required this.controller}) : super(key: key);

  static const arr = ["match1.jpg", "match2.jpg", "match3.jpg"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      controller: controller,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...List.generate(arr.length, (index) =>
            AutoScrollTag(key: ValueKey(index),
                controller: controller,
                index: index,
                child: ProfileCard(controller: controller, profile: arr[index], index: index,))
        )
      ],
    );
  }
}
