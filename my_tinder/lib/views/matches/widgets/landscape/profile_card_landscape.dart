import 'package:flutter/material.dart';
import 'package:my_tinder/constants/matches.dart';
import 'package:my_tinder/views/matches/widgets/landscape/profile_card_landscape_images_list.dart';
import 'package:my_tinder/views/matches/widgets/landscape/profile_card_landscape_main_content.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProfileCardLandscape extends StatefulWidget {
  final Match profile;
  final int index;
  final AutoScrollController controller;

  const ProfileCardLandscape(
      {Key? key,
      required this.profile,
      required this.index,
      required this.controller})
      : super(key: key);

  @override
  State<ProfileCardLandscape> createState() => _ProfileCardLandscapeState();
}

class _ProfileCardLandscapeState extends State<ProfileCardLandscape> {
  late AutoScrollController imageController;

  @override
  void initState() {
    super.initState();
    imageController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          SizedBox(
              child: Image.asset(
                widget.profile.images[0],
                fit: BoxFit.cover,
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 3),
          ProfileCardLandscapeImagesList(profile: widget.profile, controller: imageController),
          ProfileCardLandscapeMainContent(profile: widget.profile)
        ],
      ),
    );
  }
}
