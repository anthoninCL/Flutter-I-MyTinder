import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/views/components/section_item/range_slider_item.dart';
import 'package:my_tinder/views/components/section_item/selection_item.dart';
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
                    TitleSectionItem("Settings"),
                    SelectionSectionItem(
                        title: "Phone number",
                        value: "06 06 06 06 06"
                    ),
                    SelectionSectionItem(
                        title: "Email address",
                        value: "email@adress.com"
                    ),
                  ]
              ),
              const Section(
                  itemList: [
                    TitleSectionItem("Preferences"),
                    SelectionSectionItem(
                        title: "Location",
                        value: "Current location"
                    ),
                    RangeSliderSectionItem(
                        title: "Maximal ",
                        values: RangeValues(18, 25) // Donner la bonne range value
                    ),
                    SelectionSectionItem(
                        title: "I want to meet",
                        value: "Girls"
                    ),
                    SliderSectionItem(
                      title: "Test",
                      value: 10, // Donner la bonne range value
                    ),
                    SwitchSectionItem(
                      title: "Dark Theme",
                      value: false,
                    ),
                  ]
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
