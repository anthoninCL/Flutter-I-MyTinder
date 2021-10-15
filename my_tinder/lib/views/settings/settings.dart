import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/Models/profile.dart';
import 'package:my_tinder/views/components/dismiss_keyboard.dart';
import 'package:my_tinder/views/components/header_bar.dart';
import 'package:my_tinder/views/components/section_item/range_slider_item.dart';
import 'package:my_tinder/views/components/section_item/selection_item.dart';
import 'package:my_tinder/views/components/section_item/simple_item.dart';
import 'package:my_tinder/views/components/section_item/slider_item.dart';
import 'package:my_tinder/views/components/section_item/switch_item.dart';
import 'package:my_tinder/views/components/section_item/text_field.dart';
import 'package:my_tinder/views/components/section_item/title_item.dart';
import 'package:my_tinder/views/widgets/section.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  final ValueNotifier<ProfileModel?> profile;

  const Settings({Key? key, required this.profile}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  RangeValues ageRange = const RangeValues(18, 25);
  double range = 10;
  String email = "john.doe@gmail.com";
  String phoneNumber = "0634563945";

  @override
  void initState() {
    super.initState();
    ageRange = getRangeValues();
    range = widget.profile.value!.range.toDouble();
    email = widget.profile.value!.email;
    phoneNumber = widget.profile.value!.phoneNumber;
  }

  RangeValues getRangeValues() {
    var values = widget.profile.value!.ageRange.split("-");
    return RangeValues(double.parse(values[0]), double.parse(values[1]));
  }

  void saveSettings() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    var profile = ProfileModel.from(widget.profile.value!);

    profile.ageRange = ageRange.start.toString() + "-" + ageRange.end.toString();
    profile.range = range.toInt();
    profile.email = email;
    profile.phoneNumber = phoneNumber;
    widget.profile.value = profile;
    s.setString(
        "ageRange", ageRange.start.toString() + "-" + ageRange.end.toString());
    s.setInt("range", range.toInt());
    s.setString("email", email);
    s.setString("phoneNumber", phoneNumber);
  }

  void setAgeRange(value) => setState(() {
        ageRange = value;
      });

  void setRange(value) => setState(() {
        range = value;
      });

  void setPhoneNumber(value) => setState(() {
        phoneNumber = value;
      });

  void setEmail(value) => setState(() {
        email = value;
      });

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        appBar: HeaderBar(
          title: "Settings",
          onPress: saveSettings,
        ),
        body: ValueListenableBuilder<ProfileModel?>(
            valueListenable: widget.profile,
            builder: (context, ProfileModel? value, Widget? child) {
              return SafeArea(
                child: Center(
                    child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Section(itemList: [
                      TitleSectionItem("SETTINGS"),
                      TextFieldSection(
                          title: "Phone number",
                          value: phoneNumber,
                          setState: setPhoneNumber),
                      TextFieldSection(
                          title: "Email", value: email, setState: setEmail),
                    ]),
                    Section(itemList: [
                      TitleSectionItem("PREFERENCES"),
                      SelectionSectionItem(
                        title: "Location",
                        value: value!.city,
                      ),
                      RangeSliderSectionItem(
                        title: "Age",
                        values: ageRange,
                        setState: setAgeRange,
                      ),
                      SelectionSectionItem(
                          title: "I want to meet", value: "Girls"),
                      SliderSectionItem(
                        title: "Distance",
                        value: range,
                        setState: setRange,
                      ),
                      SwitchSectionItem(
                        title: "Dark Theme",
                        value: false,
                      ),
                    ]),
                    const Section(itemList: [
                      TitleSectionItem("SETTINGS"),
                      SimpleSectionItem("Privacy policy"),
                      SimpleSectionItem("Terms of use"),
                    ]),
                  ],
                )),
              );
            }),
      ),
    );
  }
}
