import 'package:flutter/material.dart';
import 'package:my_tinder/views/matches/widgets/profiles_list.dart';

class Matches extends StatefulWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: ProfileList(),
    );
  }
}
