import 'package:flutter/material.dart';
import 'package:my_tinder/constants/messages.dart';
import 'package:my_tinder/shared/utils/chat_utils.dart';
import 'package:my_tinder/views/chat/widgets/message_card.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key, required this.conversation}) : super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: conversation.conversation.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        itemBuilder: (context, index){
          return MessageCard(
              index: index,
              conversation: conversation.conversation,
              profileImage: conversation.image,
              isPrevMessageFromSameSender: isPrevMessageFromSameSender(index, conversation),
              isPrevMessageFromSameTime: isPrevMessageFromSameTime(index, conversation),
              isNextMessageFromSameSender: isNextMessageFromSameSender(index, conversation),
              isNextMessageFromSameTime: isNextMessageFromSameTime(index, conversation)
          );
        },
      ),
    );
  }
}
