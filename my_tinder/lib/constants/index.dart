import 'package:flutter/material.dart';
import 'package:my_tinder/constants/matches.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_tinder/models/messages.dart';
import 'package:my_tinder/models/new_matches.dart';

@immutable
class Constants {
  static List<Match> matches = [
    Match(
      "Anne Laure",
      [
        "assets/images/match1.jpg",
        "assets/images/profile_pic_5.jpg",
        "assets/images/profile_pic_6.jpg",
        "assets/images/profile_pic_8.jpg",
        "assets/images/profile_pic_9.jpg",
        "assets/images/profile_pic_10.jpg"
      ],
      22,
      "Travel, Sport and food, Only god can judge me...",
      "Paris",
      "2km",
      [
        Lifestyle("Travel", "Travel", true),
        Lifestyle("Globe-Trotter", "Globe-Trotter", true),
        Lifestyle("Photo", "Photo"),
        Lifestyle("Photo shooting", "Photo shooting"),
        Lifestyle("Mode", "Mode"),
        Lifestyle("Shopping", "Shopping")
      ],
      [
        Lifestyle("Zodiac Sign", "Leo", false, MdiIcons.weatherNight),
        Lifestyle("Food", "Indian", false, MdiIcons.foodForkDrink),
        Lifestyle("Pet", "Dog", false, MdiIcons.pawOutline),
        Lifestyle("Social Network", "Snapchat", false, MdiIcons.web),
        Lifestyle("Sport", "Basketball", false, MdiIcons.basketball),
        Lifestyle(
          "Cigarettes",
          "Unspecified",
          false,
          MdiIcons.cigar,
        )
      ],
    ),
    Match(
      "Vanessa",
      [
        "assets/images/match2.jpg",
        "assets/images/profile_pic_1.jpg",
        "assets/images/profile_pic_2.jpg",
        "assets/images/profile_pic_3.jpg",
        "assets/images/profile_pic_4.jpg"
      ],
      24,
      "Perfection prototype",
      "Paris",
      "8km",
      [
        Lifestyle("Travel", "Travel", true),
        Lifestyle("Globe-Trotter", "Globe-Trotter", true),
        Lifestyle("Photo", "Photo"),
        Lifestyle("Photo shooting", "Photo shooting"),
        Lifestyle("Mode", "Mode"),
        Lifestyle("Shopping", "Shopping")
      ],
      [
        Lifestyle("Zodiac Sign", "Gemini", false, MdiIcons.weatherNight),
        Lifestyle("Food", "French", false, MdiIcons.foodForkDrink),
        Lifestyle("Pet", "Rabbit", false, MdiIcons.pawOutline),
        Lifestyle("Social Network", "Instagram", false, MdiIcons.web),
        Lifestyle("Sport", "Tennis", false, MdiIcons.basketball),
        Lifestyle(
          "Cigarettes",
          "Unspecified",
          false,
          MdiIcons.cigar,
        )
      ],
    ),
    Match(
      "Veronica",
      [
        "assets/images/match3.jpg",
        "assets/images/profile_pic_11.jpg",
        "assets/images/profile_pic_12.jpg",
        "assets/images/profile_pic_13.jpg",
        "assets/images/profile_pic_14.jpg",
        "assets/images/profile_pic_15.jpg"
      ],
      20,
      "Smoke the life befo... naaa I don't smoke sorry",
      "Paris",
      "13km",
      [
        Lifestyle("Travel", "Travel", true),
        Lifestyle("Globe-Trotter", "Globe-Trotter", true),
        Lifestyle("Photo", "Photo"),
        Lifestyle("Photo shooting", "Photo shooting"),
        Lifestyle("Mode", "Mode"),
        Lifestyle("Shopping", "Shopping")
      ],
      [
        Lifestyle("Zodiac Sign", "Cancer", false, MdiIcons.weatherNight),
        Lifestyle("Food", "Italian", false, MdiIcons.foodForkDrink),
        Lifestyle("Pet", "Cat", false, MdiIcons.pawOutline),
        Lifestyle("Social Network", "Instagram", false, MdiIcons.web),
        Lifestyle("Sport", "Golf", false, MdiIcons.basketball),
        Lifestyle(
          "Cigarettes",
          "No",
          false,
          MdiIcons.cigar,
        )
      ],
    ),
    Match(
      "Alexia",
      [
        "assets/images/match4.jpg",
        "assets/images/profile_pic_16.jpg",
        "assets/images/profile_pic_17.jpg",
        "assets/images/profile_pic_18.jpg"
      ],
      26,
      "Je suis venue, j'ai bu, je me rappelle plus...",
      "Paris",
      "400m",
      [
        Lifestyle("Travel", "Travel", true),
        Lifestyle("Globe-Trotter", "Globe-Trotter", true),
        Lifestyle("Photo", "Photo"),
        Lifestyle("Photo shooting", "Photo shooting"),
        Lifestyle("Mode", "Mode"),
        Lifestyle("Shopping", "Shopping")
      ],
      [
        Lifestyle("Zodiac Sign", "Virgo", false, MdiIcons.weatherNight),
        Lifestyle("Food", "Chinese", false, MdiIcons.foodForkDrink),
        Lifestyle("Pet", "Dog", false, MdiIcons.pawOutline),
        Lifestyle("Social Network", "Instagram", false, MdiIcons.web),
        Lifestyle("Sport", "Crossfit", false, MdiIcons.basketball),
        Lifestyle(
          "Cigarettes",
          "Yes",
          false,
          MdiIcons.cigar,
        )
      ],
    ),
  ];

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
    Conversation("Judith", "assets/images/profile_pic_9.jpg", [
      Message("Hey!", "14:32", false),
      Message("Hello nice to meet you, what's going on in your life?", "14:40",
          true),
      Message("Nice to meet you too!", "14:41", false),
      Message("Well, I'm currently trying to meet some people and you?", "14:41", false),
      Message("Quite the same, I moved recently here so I want to discover the city and the people", "14:45", true),
      Message("Nice, where were you from?", "14:52", false),
      Message("I lived 10y in Miami, so the weather is quite disturbing I may say", "14:56", true),
      Message("Can you still be happy without the sun here?", "14:57", true),
      Message("Of course you can, you want to go out today to see how pleasant this city is?", "14:59", false),
      Message("Sure, what do you want to do?", "15:01", true),
      Message("Let me see", "15:03", false),
      Message("I'm free all the afternoon and the evening", "15:03", true),
      Message("So if you want to take a drink or dinner", "15:03", true),
      Message("I'm down", "15:03", true)
    ]),
    Conversation("Margaux", "assets/images/profile_pic_10.jpg", [
      Message("Hello James, what's up?", "10:17", false),
      Message("Hey, I just packed CR7 on Fifa so I'm great and you?", "10:20", true),
      Message("I don't know if it's good or not but i'm happy for you", "10:22", true),
      Message("I want to meet new people tonigth, would you be down to come with some friends of me in a party?", "10:23", false),
      Message("Wait wait wait you don't know CR7 or Fifa?", "10:24", true),
      Message("Both", "10:25", false),
      Message("Ok we need to talk", "10:26", true),
      Message("CR7 -> Cristiano Ronaldo -> the goat after Messi", "10:27", true),
      Message("Oh I see, I didn't make it before but I get it now", "10:29", false),
      Message("I saw Messi was going to PSG soon no?", "10:30", false),
      Message("Ok this is going really bad right now between us", "10:31", true),
      Message("Rule 1", "10:31", true),
      Message("We don't talk about Messi at PSG", "10:31", true)
    ]),
    Conversation("Florence", "assets/images/profile_pic_11.jpg", [
      Message("How are you doing?", "18:22", true),
      Message("Fine and you?", "18:28", false),
      Message("Doing something tonight?", "18:29", false),
      Message("Wanna drink?", "18:29", false),
      Message("Wanna drink?", "18:29", false),
      Message("Wanna drink?", "18:29", false),
      Message("Wanna drink?", "18:29", false),
      Message("Wanna drink?", "18:29", false),
      Message("Wanna drink?", "18:29", false),
      Message("Wanna drink?", "18:29", false),
      Message("Wanna drink?", "18:29", false),
      Message("Wanna drink?", "18:29", false)
    ]),
    Conversation("Line", "assets/images/profile_pic_12.jpg", [
      Message("Nice to meet you James!", "11:47", false),
      Message("Nice to meet you too Line, you're damn nice!", "11:48", true),
      Message("Whew that was fast", "11:50", false),
      Message("Oh sorry, you're absolutely sublime", "11:52", true),
      Message("But I still want to do the same thing to you", "11:53", true),
      Message("It was a pleasure, bye", "11:54", false),
      Message("At 21:00, good for you?", "11:56", true),
      Message("I rather like 22 but 21 is fine with me too", "11:56", true),
      Message("I think this app is not working...", "14:20", true),
      Message("23:00?", "18:09", true)
    ]),
    Conversation("Aurélie", "assets/images/profile_pic_13.jpg", [
      Message("Hello!", "21:12", false),
      Message("Hey Aurélie!", "21:23", true),
      Message("How are you?", "21:24", false),
      Message("Good and you?", "21:25", true),
      Message("Great, what are you doing?", "21:26", false),
      Message("I'm watching you and you?", "21:27", true),
      Message("That's weird but ok... I'm painting", "21:28", false),
      Message("Why is that weird?", "21:29", true),
      Message("Well we just met 10min ago", "21:30", false),
      Message("Oooh ok my bad", "21:31", true),
      Message("I'm watching You on Netflix", "21:31", true),
      Message("I'm not on netflix, are you a hacker?", "21:32", false),
      Message("omg...", "21:34", true)
    ]),
    Conversation("Léa", "assets/images/profile_pic_14.jpg", [
      Message("What's up?", "23:10", false),
    ]),
    Conversation("Emma", "assets/images/profile_pic_19.jpg", [
      Message("Hello hello James!", "12:50", false),
    ]),
    Conversation("Linda", "assets/images/profile_pic_20.jpg", [
      Message("Hola awesome and unknown girl, if you're petting dragon, it let you pet me", "23:32", true),
      Message("I'll call you Khaleesi", "23:40", true)
    ]),
  ];
}
