import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';
import 'package:my_tinder/views/components/section_item/icon_item.dart';
import 'package:my_tinder/views/components/section_item/selection_item.dart';
import 'package:my_tinder/views/components/section_item/simple_item.dart';
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
          child: Column(
            children: [
              Flexible(
                child: Section(itemList: [
                  const TitleSectionItem("Settings"),
                  const SimpleSectionItem("Test 1"),
                  const SelectionSectionItem(title: "Test 2", value: "Current value"),
                  IconSectionItem(
                    title: "Test 2",
                    value: "Current value",
                    icon: Icon(
                      Icons.beach_access,
                      color: AppTheme.colors.black,
                      size: 20.0,
                    ),
                  )
                ]),
              ),
              const Flexible(
                child: Section(itemList: [
                  TitleSectionItem("Title 2"),
                  SwitchSectionItem(
                    title: "Dark Theme",
                    value: false,
                  ),
                ]),
              ),
              Expanded (
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
