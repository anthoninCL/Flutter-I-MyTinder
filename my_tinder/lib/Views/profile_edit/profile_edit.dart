import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/views/components/section_item/selection_item.dart';
import 'package:my_tinder/views/components/section_item/simple_item.dart';
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
          child: Column(
            children: [
              const Flexible(
                child: Section(itemList: [
                  TitleSectionItem("Edit Profile"),
                  SimpleSectionItem("Test 1"),
                  SelectionSectionItem(title: "Test 2", value: "Current value")
                ]),
              ),
              const Flexible(
                child: Section(itemList: [
                  TitleSectionItem("Title 2"),
                  SimpleSectionItem("Test 1"),
                  SimpleSectionItem("Test 2"),
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
