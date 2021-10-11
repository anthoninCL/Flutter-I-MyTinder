import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/constants/messages.dart';
import 'package:my_tinder/views/chat/widgets/chat_bottom_bar.dart';
import 'package:my_tinder/views/chat/widgets/chat_list.dart';
import 'package:my_tinder/views/chat/widgets/conversation_header.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key, required this.conversation}) : super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: ConversationHeader(
            image: conversation.image,
            name: conversation.name,
          ),
        ),
        body: Stack(
          children: [
            ChatList(conversation: conversation),
            const ChatBottomBar()
          ],
        ),
    );
  }
}
