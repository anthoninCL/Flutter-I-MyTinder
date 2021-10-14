import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/views/components/dismiss_keyboard.dart';
import 'package:my_tinder/views/components/header_bar.dart';
import 'package:my_tinder/views/components/section_item/icon_item.dart';
import 'package:my_tinder/views/components/section_item/simple_selection_item.dart';
import 'package:my_tinder/views/components/section_item/text_input_item.dart';
import 'package:my_tinder/views/components/section_item/title_item.dart';
import 'package:my_tinder/views/widgets/section.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(title: "Informations", onPress: () => print("test"),),
      body: DismissKeyboard(
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const Section(
                    itemList: [
                      TitleSectionItem("ABOUT ME"),
                      TextInputSectionItem(value: 'Paris, France')
                    ],
                  ),
                  const Section(
                    itemList: [
                      TitleSectionItem("INTERESTS"),
                      SimpleSelectionSectionItem(value: 'Sport, Music, Travel')
                    ],
                  ),
                  const Section(
                      itemList: [
                        TitleSectionItem("LIFESTYLE"),
                        IconSectionItem(
                          icon: Icon(
                            Icons.nightlight_outlined,
                            color: Colors.black,
                          ),
                          title: "Astrological sign",
                          value: "Leo",
                        ),
                        IconSectionItem(
                          icon: Icon(
                            Icons.fastfood_outlined,
                            color: Colors.black,
                          ),
                          title: "Food",
                          value: "Vegan",
                        ),
                        IconSectionItem(
                          icon: Icon(
                            Icons.pets_outlined,
                            color: Colors.black,
                          ),
                          title: "Pet",
                          value: "Cat",
                        ),
                        IconSectionItem(
                          icon: Icon(
                            Icons.language_outlined,
                            color: Colors.black,
                          ),
                          title: "Social Network",
                          value: "Not specified",
                        ),
                        IconSectionItem(
                          icon: Icon(
                            Icons.sports_basketball_outlined,
                            color: Colors.black,
                          ),
                          title: "Sport",
                          value: "Football",
                        ),
                        IconSectionItem(
                          icon: Icon(
                            Icons.local_bar_outlined,
                            color: Colors.black,
                          ),
                          title: "Drinks",
                          value: "Gin and tonic",
                        ),
                        IconSectionItem(
                          icon: Icon(
                            Icons.smoking_rooms_outlined,
                            color: Colors.black,
                          ),
                          title: "Cigarettes",
                          value: "No",
                        ),
                      ]
                  ),
                  const Section(
                    itemList: [
                      TitleSectionItem("CITY"),
                      SimpleSelectionSectionItem(value: 'Paris, France')
                    ],
                  ),
                  const Section(
                    itemList: [
                      TitleSectionItem("GENDER"),
                      SimpleSelectionSectionItem(value: 'Male')
                    ],
                  ),
                  const Section(
                    itemList: [
                      TitleSectionItem("SEXUAL ORIENTATION"),
                      SimpleSelectionSectionItem(value: "Hetero")
                    ],
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
