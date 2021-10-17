import 'package:flutter/material.dart';
import 'package:my_tinder/models/messages.dart';
import 'package:my_tinder/models/new_matches.dart';
import 'package:my_tinder/shared/widgets/clickable_avatar.dart';
import 'package:my_tinder/views/chat/chat.dart';

class NewMatchesList extends StatelessWidget {
  final List<NewMatches> matches;

  const NewMatchesList({Key? key, required this.matches}) : super(key: key);

  void onTap(BuildContext context, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Chat(conversation: Conversation(matches[index].name, matches[index].image, []));
    }));
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
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 10.0 : 0),
                child: ClickableAvatar(
                  image: matches[index].image,
                  radius: 40,
                  name: matches[index].name,
                  onTap: () => onTap(context, index),
                ),
              );
            }
          }
      );
    }
  }
}