import 'package:flutter/material.dart';
import 'package:my_tinder/constants/index.dart';
import 'package:my_tinder/shared/widgets/clickable_avatar.dart';

class NewMatchesList extends StatelessWidget {

  const NewMatchesList({Key? key}) : super(key: key);

  void printProfileInfo(int index) {
    // this need to navigate to the right conversation
    // ignore: avoid_print
    print(Constants.newMatches[index].name);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 13.0),
      scrollDirection: Axis.horizontal,
      itemCount: Constants.newMatches.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == Constants.newMatches.length) {
          return const SizedBox(width: 5.0);
        } else {
          return ClickableAvatar(
              image: Constants.newMatches[index].image,
              radius: 40,
              name: Constants.newMatches[index].name,
              onTap: () => printProfileInfo(index),
          );
        }
      }
    );
  }
}