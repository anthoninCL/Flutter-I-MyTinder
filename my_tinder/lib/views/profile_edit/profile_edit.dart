import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/models/lifestyle.dart';
import 'package:my_tinder/models/profile.dart';
import 'package:my_tinder/views/components/dismiss_keyboard.dart';
import 'package:my_tinder/views/components/header_bar.dart';
import 'package:my_tinder/views/components/section_item/icon_item.dart';
import 'package:my_tinder/views/components/section_item/simple_selection_item.dart';
import 'package:my_tinder/views/components/section_item/text_input_item.dart';
import 'package:my_tinder/views/components/section_item/title_item.dart';
import 'package:my_tinder/views/widgets/section.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEdit extends StatefulWidget {
  ValueNotifier<ProfileModel?> profile;

  ProfileEdit({Key? key, required this.profile}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  // Lifestyles list row
  late List<Lifestyle> lifestyleList;

  List<Lifestyle> getLifestyles() {
    return [
      Lifestyle(
          Icon(
            Icons.nightlight_outlined,
            color: Colors.black,
          ),
          "Zodiac sign",
          widget.profile.value!.zodiacSign),
      Lifestyle(
          Icon(
            Icons.fastfood_outlined,
            color: Colors.black,
          ),
          "Food",
          widget.profile.value!.food),
      Lifestyle(
          Icon(
            Icons.pets_outlined,
            color: Colors.black,
          ),
          "Pet",
          widget.profile.value!.pet),
      Lifestyle(
          Icon(
            Icons.language_outlined,
            color: Colors.black,
          ),
          "Social Network",
          widget.profile.value!.socialNetwork),
      Lifestyle(
          Icon(
            Icons.sports_basketball_outlined,
            color: Colors.black,
          ),
          "Sport",
          widget.profile.value!.sport),
      Lifestyle(
          Icon(
            Icons.local_bar_outlined,
            color: Colors.black,
          ),
          "Drinks",
          widget.profile.value!.drinks),
      Lifestyle(
          Icon(
            Icons.smoking_rooms_outlined,
            color: Colors.black,
          ),
          "Cigarettes",
          widget.profile.value!.cigarettes),
    ];
  }

  @override
  void initState() {
    super.initState();
    lifestyleList = getLifestyles();
  }

  // Save profile in the Localstore, triggered on Finish Text button
  void saveInformations() async {
    SharedPreferences s = await SharedPreferences.getInstance();

    s.setString("bio", widget.profile.value!.bio);
    s.setStringList("interests", widget.profile.value!.interests);
    for (var lifestyle in lifestyleList) {
      s.setString(lifestyle.title, lifestyle.value);
    }
    s.setString("city", widget.profile.value!.city);
    s.setString("gender", widget.profile.value!.gender);
    s.setString("orientation", widget.profile.value!.orientation);
  }

  // On Submit functions
  void onSubmitBio(String value) {
    var profile = ProfileModel.from(widget.profile.value!);
    profile.bio = value;
    widget.profile.value = profile;
  }

  void onSubmitInterests(String value) {
    var profile = ProfileModel.from(widget.profile.value!);
    profile.interests = value.replaceAll(", ", ",").trim().split(",");
    widget.profile.value = profile;
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        appBar: HeaderBar(
          title: "Informations",
          onPress: saveInformations,
        ),
        body: ValueListenableBuilder<ProfileModel?>(
            valueListenable: widget.profile,
            builder: (context, ProfileModel? value, Widget? child) {
              return SafeArea(
                child: Center(
                    child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Section(
                      itemList: [
                        const TitleSectionItem("ABOUT ME"),
                        TextInputSectionItem(
                          profile: widget.profile,
                          onSubmit: onSubmitBio,
                        ),
                      ],
                    ),
                    Section(
                      itemList: [
                        TitleSectionItem("INTERESTS"),
                        SimpleSelectionSectionItem(
                          profile: widget.profile,
                          value: widget.profile.value!.interests.join(", "),
                          onSubmit: onSubmitInterests, // TODO: use the modal
                        )
                      ],
                    ),
                    Section(itemList: [
                      TitleSectionItem("LIFESTYLE"),
                      Column(
                        children: lifestyleList.map((lifestyle) {
                          return IconSectionItem(
                            icon: lifestyle.icon,
                            title: lifestyle.title,
                            value: lifestyle.value,
                          );
                        }).toList(),
                      )
                    ]),
                    Section(
                      itemList: [
                        TitleSectionItem("CITY"),
                        SimpleSelectionSectionItem(
                          profile: widget.profile,
                          value: widget.profile.value!.city,
                          onSubmit: () => print("TODO"), // TODO: use the modal
                        )
                      ],
                    ),
                    Section(
                      itemList: [
                        TitleSectionItem("GENDER"),
                        SimpleSelectionSectionItem(
                          profile: widget.profile,
                          value: widget.profile.value!.gender,
                          onSubmit: () => print("TODO"), // TODO: use the modal
                        )
                      ],
                    ),
                    Section(
                      itemList: [
                        TitleSectionItem("SEXUAL ORIENTATION"),
                        SimpleSelectionSectionItem(
                          profile: widget.profile,
                          value: widget.profile.value!.orientation,
                          onSubmit: () => print("TODO"), // TODO: use the modal
                        )
                      ],
                    ),
                  ],
                )),
              );
            }),
      ),
    );
  }
}
