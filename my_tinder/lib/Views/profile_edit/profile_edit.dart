import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/views/components/section_item/icon_item.dart';
import 'package:my_tinder/views/components/section_item/range_slider_item.dart';
import 'package:my_tinder/views/components/section_item/selection_item.dart';
import 'package:my_tinder/views/components/section_item/simple_item.dart';
import 'package:my_tinder/views/components/section_item/slider_item.dart';
import 'package:my_tinder/views/components/section_item/switch_item.dart';
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
      body: SafeArea(
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const Section(
                  itemList: [
                    TitleSectionItem("Lifestyle"),
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
                  TitleSectionItem("City"),
                  SimpleSectionItem("Paris, France")
                ],
              ),
              const Section(
                itemList: [
                  TitleSectionItem("Gender"),
                  SimpleSectionItem("Male")
                ],
              ),
              const Section(
                itemList: [
                  TitleSectionItem("Sexual orientation"),
                  SimpleSectionItem("Hetero")
                ],
              ),
              TextButton(onPressed: () {
                Navigator.pop(context);
                }, child: const Text("Go back")
              ),
            ],
          )
        ),
      ),
    );
  }
}
