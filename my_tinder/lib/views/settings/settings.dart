import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/views/components/section_item/range_slider_item.dart';
import 'package:my_tinder/views/components/section_item/selection_item.dart';
import 'package:my_tinder/views/components/section_item/simple_item.dart';
import 'package:my_tinder/views/components/section_item/slider_item.dart';
import 'package:my_tinder/views/components/section_item/switch_item.dart';
import 'package:my_tinder/views/components/section_item/title_item.dart';
import 'package:my_tinder/views/widgets/section.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                      TitleSectionItem("SETTINGS"),
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
                          values: RangeValues(18, 25) // TODO: Donner la bonne range value
                      ),
                      SelectionSectionItem(
                          title: "I want to meet",
                          value: "Girls"
                      ),
                      SliderSectionItem(
                        title: "Test",
                        value: 10, // TODO: Donner la bonne range value
                      ),
                      SwitchSectionItem(
                        title: "Dark Theme",
                        value: false,
                      ),
                    ]
                ),
                const Section(
                    itemList: [
                      TitleSectionItem("Settings"),
                      SimpleSectionItem("Privacy policy"),
                      SimpleSectionItem("Terms of use"),
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
