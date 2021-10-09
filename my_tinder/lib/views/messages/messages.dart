import 'package:flutter/material.dart';
import 'package:my_tinder/shared/widgets/clickable_avatar.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  void printHello() {
    // ignore: avoid_print
    print("hello");
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/profile_picture_example.jpeg"), context);
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: ClickableAvatar(
              image: "assets/images/profile_picture_example.jpeg",
              radius: 30,
              name: "Léa",
              onTap: printHello,
            )
        ),
      ),
    );
  }
}
