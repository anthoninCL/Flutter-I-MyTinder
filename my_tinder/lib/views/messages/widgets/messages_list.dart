import 'package:flutter/material.dart';
import 'package:my_tinder/constants/index.dart';
import 'message_item.dart';

class MessagesList extends StatelessWidget {

  const MessagesList({Key? key}) : super(key: key);

  void printProfileInfo(int index) {
    // this need to navigate to the right conversation
    // ignore: avoid_print
    print(Constants.messages[index].name);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 5.0),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: Constants.messages.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == Constants.messages.length) {
          return const SizedBox(height: 20.0);
        }
        else {
          return MessageItem(
            name: Constants.messages[index].name,
            image: Constants.messages[index].image,
            lastMessage: Constants.messages[index].conversation.last,
            onTap: () => printProfileInfo(index),
          );
        }
      }
    );
  }
}