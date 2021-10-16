import 'package:flutter/material.dart';
import 'package:my_tinder/models/messages.dart';
import 'package:my_tinder/themes/app_theme.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.message, required this.radius}) : super(key: key);

  final Message message;
  final BorderRadiusGeometry radius;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = message.sendByMe ? AppTheme.colors.primary : AppTheme.colors.white;
    final textColor = message.sendByMe ? AppTheme.colors.white : AppTheme.colors.black;

    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        color: backgroundColor,
      ),
      padding: const EdgeInsets.all(12),
      child: Text(
        message.content,
        style: TextStyle(
            fontSize: 15,
            color: textColor
        ),
      ),
    );
  }
}
