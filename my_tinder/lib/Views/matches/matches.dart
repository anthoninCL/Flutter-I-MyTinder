import 'package:flutter/material.dart';
import 'package:my_tinder/views/components/section_item/item.dart';
import 'package:my_tinder/views/components/section_item/simple_item.dart';
import 'package:my_tinder/views/components/section_item/title_item.dart';
import 'package:my_tinder/views/widgets/section.dart';

class Matches extends StatefulWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
              children: const [
                Flexible(
                  child: Section(itemList: [
                    TitleSectionItem("Title 1"),
                    SimpleSectionItem("Test 1"),
                    SimpleSectionItem("Test 2"),
                  ]),
                ),
                Flexible(
                  child: Section(itemList: [
                    TitleSectionItem("Title 2"),
                    SimpleSectionItem("Test 1"),
                    SimpleSectionItem("Test 2"),
                  ]),
                )
              ],
            ),
        ),
      )
    );
  }
}
