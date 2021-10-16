import 'package:flutter/material.dart';
import 'package:my_tinder/models/messages.dart';
import 'package:my_tinder/views/chat/widgets/chat_bottom_bar.dart';
import 'package:my_tinder/views/chat/widgets/chat_list.dart';
import 'package:my_tinder/views/chat/widgets/conversation_header.dart';
import 'package:my_tinder/views/components/dismiss_keyboard.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key, required this.conversation}) : super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
            child: ConversationHeader(
              image: conversation.image,
              name: conversation.name,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                  child: ChatList(conversation: conversation)
              ),
              const ChatBottomBar()
            ],
          ),
      ),
    );
  }
}
