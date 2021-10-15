import 'package:flutter/material.dart';
import 'package:my_tinder/Models/new_matches.dart';
import 'package:my_tinder/shared/widgets/clickable_avatar.dart';

class NewMatchesList extends StatelessWidget {
  final List<NewMatches> matches;

  const NewMatchesList({Key? key, required this.matches}) : super(key: key);

  void printProfileInfo(int index) {
    // this need to navigate to the right conversation
    // ignore: avoid_print
    print(matches[index].name);
  }

  @override
  Widget build(BuildContext context) {
    if (matches.isEmpty) {
      return const Align(
          alignment: Alignment.topCenter,
          child: Text(
            "No result found",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto'
            ),
          )
      );
    }
    else {
      return ListView.separated(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: 13.0),
          scrollDirection: Axis.horizontal,
          itemCount: matches.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == matches.length) {
              return const SizedBox(width: 5.0);
            } else {
              return ClickableAvatar(
                image: matches[index].image,
                radius: 40,
                name: matches[index].name,
                onTap: () => printProfileInfo(index),
              );
            }
          }
      );
    }
  }
}