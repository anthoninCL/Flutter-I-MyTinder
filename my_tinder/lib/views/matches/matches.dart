import 'package:flutter/material.dart';
import 'package:my_tinder/Views/matches/widgets/profiles_list.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Matches extends StatefulWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {

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
    return Scaffold(
      extendBody: true,
      body: OrientationBuilder(
        builder: (context, builder) {
          return ProfileList(controller: controller);
        }
      ),
    );
  }
}
