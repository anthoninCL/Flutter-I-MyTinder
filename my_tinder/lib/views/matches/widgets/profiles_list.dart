import 'package:flutter/material.dart';
import 'package:my_tinder/constants/index.dart';
import 'package:my_tinder/views/matches/widgets/landscape/profile_card_landscape.dart';
import 'package:my_tinder/views/matches/widgets/portrait/profile_card_portrait.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  late AutoScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ListView(
          scrollDirection: Axis.vertical,
          controller: controller,
          padding: EdgeInsets.zero,
          //physics: const NeverScrollableScrollPhysics(),
          children: [
            ...List.generate(
                Constants.matches.length,
                (index) => AutoScrollTag(
                    key: ValueKey(index),
                    controller: controller,
                    index: index,
                    child: orientation == Orientation.portrait
                        ? ProfileCardPortrait(
                            controller: controller,
                            profile: Constants.matches[index],
                            index: index,
                          )
                        : ProfileCardLandscape(
                            controller: controller,
                            profile: Constants.matches[index],
                            index: index,
                          )))
          ],
        );
      },
    );
  }
}
