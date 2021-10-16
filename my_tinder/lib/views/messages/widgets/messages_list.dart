import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_tinder/models/messages.dart';
import 'package:my_tinder/views/chat/chat.dart';
import 'message_item.dart';

class MessagesList extends StatelessWidget {
  final List<Conversation> conversations;

  const MessagesList({Key? key, required this.conversations}) : super(key: key);

  void onTap(BuildContext context, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Chat(conversation: conversations[index]);
    }));
  }

  @override
  Widget build(BuildContext context) {
    if (conversations.isEmpty) {
      return const Align(
          alignment: Alignment.center,
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
          separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 5.0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: conversations.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == conversations.length) {
              return const SizedBox(height: 20.0);
            }
            else {
              return MessageItem(
                name: conversations[index].name,
                image: conversations[index].image,
                lastMessage: conversations[index].conversation.last,
                onTap: () => onTap(context, index),
              );
            }
          }
      );
    }
  }
}