import 'package:flutter/material.dart';
import 'package:my_tinder/models/messages.dart';
import 'package:my_tinder/models/new_matches.dart';

@immutable
class Constants {
  static List<NewMatches> newMatches = [
    NewMatches("Marine", "assets/images/profile_pic_1.jpg"),
    NewMatches("Paula", "assets/images/profile_pic_2.jpg"),
    NewMatches("Jeanne", "assets/images/profile_pic_3.jpg"),
    NewMatches("Pauline", "assets/images/profile_pic_4.jpg"),
    NewMatches("Amy", "assets/images/profile_pic_5.jpg"),
    NewMatches("Melinda", "assets/images/profile_pic_6.jpg"),
    NewMatches("Tea", "assets/images/profile_pic_7.jpg"),
    NewMatches("Iris", "assets/images/profile_pic_8.jpg"),
  ];

  static List<Conversation> messages = [
    Conversation(
        "Marine",
        "assets/images/profile_pic_9.jpg",
        [
          Message("Hey!", "14:32", false),
          Message("Hello nice to meet you, what's going on in your life?", "14:40", true)
        ]
    ),
    Conversation(
        "Sam",
        "assets/images/profile_pic_6.jpg",
        [
          Message("Hello James, what's up?", "10:17", false),
        ]
    ),
    Conversation(
        "Julie",
        "assets/images/profile_pic_10.jpg",
        [
          Message("How are you doing?", "18:22", true),
          Message("Fine and you?", "18:28", false),
          Message("Doing something tonight?", "18:29", false)
        ]
    ),
    Conversation(
        "Lucina",
        "assets/images/profile_pic_1.jpg",
        [
          Message("Nice to meet you James!", "11:47", false),
        ]
    ),
    Conversation(
        "Sandy",
        "assets/images/profile_pic_5.jpg",
        [
          Message("Hello!", "21:12", false),
          Message("Hey Sandy!", "21:23", true)
        ]
    ),
    Conversation(
        "Jin",
        "assets/images/profile_pic_7.jpg",
        [
          Message("What's up?", "23:10", false),
        ]
    ),
    Conversation(
        "Marta",
        "assets/images/profile_pic_8.jpg",
        [
          Message("Hello hello James!", "12:50", false),
        ]
    ),
    Conversation(
        "Jandice",
        "assets/images/profile_pic_2.jpg",
        [
          Message("Hey! How are you?", "14:32", true),
        ]
    ),
  ];
}