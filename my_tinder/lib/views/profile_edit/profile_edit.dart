import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_tinder/models/lifestyle.dart';
import 'package:my_tinder/models/profile.dart';
import 'package:my_tinder/shared/widgets/button.dart';
import 'package:my_tinder/views/components/dismiss_keyboard.dart';
import 'package:my_tinder/views/components/header_bar.dart';
import 'package:my_tinder/views/components/section_item/icon_item.dart';
import 'package:my_tinder/views/components/section_item/simple_selection_item.dart';
import 'package:my_tinder/views/components/section_item/text_input_item.dart';
import 'package:my_tinder/views/components/section_item/title_item.dart';
import 'package:my_tinder/views/widgets/section.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEdit extends StatefulWidget {
  final ValueNotifier<ProfileModel?> profile;

  const ProfileEdit({Key? key, required this.profile}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  // Lifestyles list row
  String zodiacSign = "Unspecified";
  String food = "Unspecified";
  String pet = "Unspecified";
  String socialNetwork = "Unspecified";
  String sport = "Unspecified";
  String drinks = "Unspecified";
  String cigarettes = "Unspecified";
  late List<Lifestyle> lifestyleList;

  @override
  void initState() {
    super.initState();
    zodiacSign = widget.profile.value!.zodiacSign;
    socialNetwork = widget.profile.value!.socialNetwork;
    food = widget.profile.value!.food;
    sport = widget.profile.value!.sport;
    pet = widget.profile.value!.pet;
    drinks = widget.profile.value!.drinks;
    cigarettes = widget.profile.value!.cigarettes;
    lifestyleList = getLifestyles();
  }

  List<Lifestyle> getLifestyles() {
    return [
      Lifestyle(
        const Icon(
          Icons.nightlight_outlined,
          color: Colors.black,
        ),
        "Zodiac Sign",
        zodiacSign,
        "What is your zodiac sign ?",
        getZodiacButtonList(),
        setZodiacSign,
      ),
      Lifestyle(
        const Icon(
          Icons.fastfood_outlined,
          color: Colors.black,
        ),
        "Food",
        food,
        "What is your favorite food ?",
        getFoodList(),
        setFood,
      ),
      Lifestyle(
        const Icon(
          Icons.pets_outlined,
          color: Colors.black,
        ),
        "Pet",
        pet,
        "What is your favorite pet ?",
        getPetList(),
        setPet,
      ),
      Lifestyle(
        const Icon(
          Icons.language_outlined,
          color: Colors.black,
        ),
        "Social Network",
        socialNetwork,
        "Select your favorite social network ?",
        getSocialNetworkList(),
        setSocialNetwork,
      ),
      Lifestyle(
        const Icon(
          Icons.sports_basketball_outlined,
          color: Colors.black,
        ),
        "Sport",
        sport,
        "Which sport do you prefers ?",
        getSportList(),
        setSport,
      ),
      Lifestyle(
          const Icon(
            Icons.local_bar_outlined,
            color: Colors.black,
          ),
          "Drinks",
          drinks,
          "What is your favorite cocktail ?",
          getDrinkList(),
          setDrinks
      ),
      Lifestyle(
          const Icon(
            Icons.smoking_rooms_outlined,
            color: Colors.black,
          ),
          "Cigarettes",
          cigarettes,
          "Do you smoke ?",
          getCigaretteList(),
          setCigarette
      ),
    ];
  }

  List<TilesButton> getZodiacButtonList() {
    return [
      TilesButton(
        title: 'Capricorn',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Aquarius',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Pisces',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Aries',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Taurus',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Gemini',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Cancer',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Leo',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Virgo',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Libra',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Scorpio',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Sagittarius',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
      ),
    ];
  }
  List<TilesButton> getFoodList() {
    return [
      TilesButton(
        title: 'Pizza',
        value: food,
        setValue: setFood,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Pasta',
        value: food,
        setValue: setFood,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Veggie',
        value: food,
        setValue: setFood,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Meat',
        value: food,
        setValue: setFood,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Cheese',
        value: food,
        setValue: setFood,
        iconData: MdiIcons.nullIcon,
      ),
    ];
  }
  List<TilesButton> getPetList() {
    return [
      TilesButton(
        title: 'Dog',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Cat',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Bird',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
      ),
    ];
  }
  List<TilesButton> getSocialNetworkList() {
    return [
      TilesButton(
        title: 'Instagram',
        value: socialNetwork,
        setValue: setSocialNetwork,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Facebook',
        value: socialNetwork,
        setValue: setSocialNetwork,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'LinkedIn',
        value: socialNetwork,
        setValue: setSocialNetwork,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'TikTok',
        value: socialNetwork,
        setValue: setSocialNetwork,
        iconData: MdiIcons.nullIcon,
      ),
    ];
  }
  List<TilesButton> getSportList() {
    return [
      TilesButton(
        title: 'Football',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Basketball',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Tennis',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Rugby',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
      ),
    ];
  }
  List<TilesButton> getDrinkList() {
    return [
      TilesButton(
        title: 'Rhum',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Vodka',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Whisky',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Gin',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
      ),
    ];
  }
  List<TilesButton> getCigaretteList() {
    return [
      TilesButton(
        title: 'Yes',
        value: cigarettes,
        setValue: setCigarette,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'No',
        value: cigarettes,
        setValue: setCigarette,
        iconData: MdiIcons.nullIcon,
      ),
      TilesButton(
        title: 'Sometimes',
        value: cigarettes,
        setValue: setCigarette,
        iconData: MdiIcons.nullIcon,
      ),
    ];
  }

  // Save profile in the Localstore, triggered on Finish Text button
  void saveInformations() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    var profile = ProfileModel.from(widget.profile.value!);

    profile.zodiacSign = zodiacSign;
    profile.food = food;
    profile.pet = pet;
    profile.socialNetwork = socialNetwork;
    profile.drinks = drinks;
    profile.sport = sport;
    profile.cigarettes = cigarettes;
    widget.profile.value = profile;
    s.setString("bio", widget.profile.value!.bio);
    s.setStringList("interests", widget.profile.value!.interests);
    s.setString("city", widget.profile.value!.city);
    s.setString("gender", widget.profile.value!.gender);
    s.setString("orientation", widget.profile.value!.orientation);
    s.setString("zodiac sign", zodiacSign);
    s.setString("food", food);
    s.setString("pet", pet);
    s.setString("social network", socialNetwork);
    s.setString("sport", sport);
    s.setString("drinks", drinks);
    s.setString("cigarettes", cigarettes);
  }

  void setZodiacSign(value) => setState(() {
    zodiacSign = value;
  });

  void setFood(value) => setState(() {
    food = value;
  });

  void setPet(value) => setState(() {
    pet = value;
  });

  void setSocialNetwork(value) => setState(() {
    socialNetwork = value;
  });

  void setSport(value) => setState(() {
    sport = value;
  });

  void setDrinks(value) => setState(() {
    drinks = value;
  });

  void setCigarette(value) => setState(() {
    cigarettes = value;
  });

  void setGender(value) => setState(() {
    var profile = ProfileModel.from(widget.profile.value!);
    profile.gender = value;
    widget.profile.value = profile;
  });

  void setOrientation(value) => setState(() {
    var profile = ProfileModel.from(widget.profile.value!);
    profile.orientation = value;
    widget.profile.value = profile;
  });

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
                        const TitleSectionItem("INTERESTS"),
                        SimpleSelectionSectionItem(
                          profile: widget.profile,
                          value: widget.profile.value!.interests.join(", "),
                          setState: onSubmitInterests,
                          modalTitle: '',
                          list: [], // TODO: use the modal
                        )
                      ],
                    ),
                    Section(itemList: [
                      const TitleSectionItem("LIFESTYLE"),
                      Column(
                        children: getLifestyles().map((lifestyle) {
                          return IconSectionItem(
                            icon: lifestyle.icon,
                            title: lifestyle.title,
                            value: lifestyle.value,
                            list: lifestyle.list,
                            modalTitle: lifestyle.modalTitle,
                            setState: lifestyle.setState,
                          );
                        }).toList(),
                      )
                    ]),
                    Section(
                      itemList: [
                        const TitleSectionItem("GENDER"),
                        SimpleSelectionSectionItem(
                          profile: widget.profile,
                          value: widget.profile.value!.gender,
                          list: [
                            TilesButton(
                              title: 'Man',
                              value: widget.profile.value!.gender,
                              setValue: setGender,
                              iconData: Icons.male,
                            ),
                            TilesButton(
                              title: 'Woman',
                              value: widget.profile.value!.gender,
                              setValue: setGender,
                              iconData: Icons.female,
                            ),
                            TilesButton(
                              title: 'Other',
                              value: widget.profile.value!.gender,
                              setValue: setGender,
                              iconData: Icons.edit,
                            )
                          ],
                          setState: setGender,
                          modalTitle: 'I am...',
                        )
                      ],
                    ),
                    Section(
                      itemList: [
                        const TitleSectionItem("SEXUAL ORIENTATION"),
                        SimpleSelectionSectionItem(
                          profile: widget.profile,
                          value: widget.profile.value!.orientation,
                          list: [
                            TilesButton(
                              title: 'Heterosexual',
                              value: widget.profile.value!.orientation,
                              setValue: setOrientation,
                              iconData: Icons.male,
                            ),
                            TilesButton(
                              title: 'Gay',
                              value: widget.profile.value!.orientation,
                              setValue: setOrientation,
                              iconData: Icons.female,
                            ),
                            TilesButton(
                              title: 'Bi',
                              value: widget.profile.value!.orientation,
                              setValue: setOrientation,
                              iconData: Icons.edit,
                            )
                          ],
                          setState: setOrientation,
                          modalTitle: 'Define your sexual orientation',
                           // TODO: use the modal
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
