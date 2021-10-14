import 'package:flutter/material.dart';
import 'package:my_tinder/constants/messages.dart';
import 'package:my_tinder/shared/widgets/clickable_avatar.dart';
import 'package:my_tinder/views/chat/widgets/message_bubble.dart';
import 'package:my_tinder/views/chat/widgets/message_time.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
    required this.index,
    required this.conversation,
    required this.profileImage,
    required this.isPrevMessageFromSameSender,
    required this.isPrevMessageFromSameTime,
    required this.isNextMessageFromSameSender,
    required this.isNextMessageFromSameTime
  }) : super(key: key);

  final int index;
  final List<Message> conversation;
  final String profileImage;
  final bool isPrevMessageFromSameSender;
  final bool isPrevMessageFromSameTime;
  final bool isNextMessageFromSameSender;
  final bool isNextMessageFromSameTime;

  @override
  Widget build(BuildContext context) {

    final radius = isPrevMessageFromSameSender && isNextMessageFromSameSender && isPrevMessageFromSameTime && isNextMessageFromSameTime
        ? conversation[index].sendByMe
        ? const BorderRadius.only(topRight: Radius.zero, topLeft: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.zero)
        : const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.zero, bottomLeft: Radius.zero, bottomRight: Radius.circular(20))
        : isPrevMessageFromSameSender && isPrevMessageFromSameTime
        ? conversation[index].sendByMe
        ? const BorderRadius.only(topRight: Radius.zero, topLeft: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        : const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.zero, bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        : isNextMessageFromSameSender && isNextMessageFromSameTime
        ? conversation[index].sendByMe
        ? const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.zero)
        : const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20), bottomLeft: Radius.zero, bottomRight: Radius.circular(20))
        : BorderRadius.circular(20);

    final alignment = conversation[index].sendByMe ? Alignment.topRight : Alignment.topLeft;
    final mainAxisAlignment = conversation[index].sendByMe ? MainAxisAlignment.end : MainAxisAlignment.start;
    final crossAxisAlignment = conversation[index].sendByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final showAvatar = !conversation[index].sendByMe && (!isNextMessageFromSameSender || !isNextMessageFromSameTime);
    final showMessageTime = !isNextMessageFromSameSender || !isNextMessageFromSameTime;
    final leftPadding = conversation[index].sendByMe ? 80.0 : 14.0;
    final rightPadding = conversation[index].sendByMe ? 14.0 : 80.0;

    return Container(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: rightPadding,
      ),
      child: Align(
        alignment: alignment,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 5,
                  bottom: 25
              ),
              child: showAvatar
                  ? ClickableAvatar(image: profileImage, radius: 12.5)
                  : const SizedBox(width: 25),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  MessageBubble(
                      message: conversation[index],
                      radius: radius
                  ),
                  const SizedBox(height: 5),
                  if (showMessageTime)
                    MessageTime(
                      time: conversation[index].time,
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
