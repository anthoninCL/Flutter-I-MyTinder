import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_tinder/constants/matches.dart';
import 'package:my_tinder/shared/widgets/button.dart';
import 'package:my_tinder/themes/app_theme.dart';
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
  late MatchButton skipButton;
  late MatchButton likeButton;

  @override
  void initState() {
    super.initState();
    imageController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);

    // Initialise buttons
    skipButton = MatchButton(const Icon(Icons.close, color: Colors.black),
        SystemSoundType.alert, widget.controller, widget.index);
    likeButton = MatchButton(
      Icon(Icons.favorite_outline, size: 25, color: AppTheme.colors.primary),
      SystemSoundType.alert,
      widget.controller,
      widget.index,
    );
  }

  Widget buildMatchButton(MatchButton button) => button.buildButton();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      top: false,
      right: true,
      bottom: false,
      child: Row(
        children: [
          SizedBox(
              child: Image.asset(
                widget.profile.images[0],
                fit: BoxFit.cover,
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 3),
          ProfileCardLandscapeImagesList(profile: widget.profile),
          ProfileCardLandscapeMainContent(profile: widget.profile),
          Column(
            children: [
              buildMatchButton(likeButton),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              buildMatchButton(skipButton),
            ],
          ),
        ],
      ),
    );
  }
}
