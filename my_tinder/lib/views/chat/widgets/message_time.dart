import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class MessageTime extends StatelessWidget {
  const MessageTime({Key? key, required this.time}) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: Text(
        time,
        style: TextStyle(
            color: AppTheme.colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w300
        ),
      ),
    );
  }
}
