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
import 'package:my_tinder/views/profile_edit/widgets/picture_selector_list.dart';
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
        "What kind of food do you eat ?",
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
        "Do you have a pet ?",
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
        "Select your favorite social network",
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
        "Which sport do you practice ?",
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
        isArray: false
      ),
      TilesButton(
        title: 'Aquarius',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Pisces',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Aries',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Taurus',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Gemini',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Cancer',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Leo',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Virgo',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Libra',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Scorpio',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Sagittarius',
        value: zodiacSign,
        setValue: setZodiacSign,
        iconData: MdiIcons.nullIcon,
        isArray: false
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
        isArray: false
      ),
      TilesButton(
        title: 'Pasta',
        value: food,
        setValue: setFood,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Vegan',
        value: food,
        setValue: setFood,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Meat',
        value: food,
        setValue: setFood,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
        title: 'Cheese',
        value: food,
        setValue: setFood,
        iconData: MdiIcons.nullIcon,
        isArray: false
      ),
      TilesButton(
          title: 'Indian',
          value: food,
          setValue: setFood,
          iconData: MdiIcons.nullIcon,
          isArray: false
      ),
      TilesButton(
          title: 'French',
          value: food,
          setValue: setFood,
          iconData: MdiIcons.nullIcon,
          isArray: false
      ),
      TilesButton(
          title: 'Italian',
          value: food,
          setValue: setFood,
          iconData: MdiIcons.nullIcon,
          isArray: false
      ),
      TilesButton(
          title: 'Chinese',
          value: food,
          setValue: setFood,
          iconData: MdiIcons.nullIcon,
          isArray: false
      ),
      TilesButton(
          title: 'Burger',
          value: food,
          setValue: setFood,
          iconData: MdiIcons.nullIcon,
          isArray: false
      ),
      TilesButton(
          title: 'Sushi',
          value: food,
          setValue: setFood,
          iconData: MdiIcons.nullIcon,
          isArray: false
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
        isArray: false,
      ),
      TilesButton(
        title: 'Cat',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Bird',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Snake',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Rabbit',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Horse',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Lucas',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Poney',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Gold Fish',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Licorne',
        value: pet,
        setValue: setPet,
        iconData: MdiIcons.nullIcon,
        isArray: false,
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
        isArray: false,
      ),
      TilesButton(
        title: 'Facebook',
        value: socialNetwork,
        setValue: setSocialNetwork,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'LinkedIn',
        value: socialNetwork,
        setValue: setSocialNetwork,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'TikTok',
        value: socialNetwork,
        setValue: setSocialNetwork,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Snapchat',
        value: socialNetwork,
        setValue: setSocialNetwork,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'WatcHelp',
        value: socialNetwork,
        setValue: setSocialNetwork,
        iconData: MdiIcons.nullIcon,
        isArray: false,
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
        isArray: false,
      ),
      TilesButton(
        title: 'Basketball',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Tennis',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Rugby',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Ski',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Snowboard',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Golf',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Crossfit',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Handball',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Hockey',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Soccer',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Baseball',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Gym',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Hiking',
        value: sport,
        setValue: setSport,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
    ];
  }
  List<TilesButton> getDrinkList() {
    return [
      TilesButton(
        title: 'Cuba Libre',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Cosmopolitan',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Sex on the beach',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Gin and tonic',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Vodka with energy drink',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Tequila sunrise',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Whisky and coke',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Mojito',
        value: drinks,
        setValue: setDrinks,
        iconData: MdiIcons.nullIcon,
        isArray: false,
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
        isArray: false,
      ),
      TilesButton(
        title: 'No',
        value: cigarettes,
        setValue: setCigarette,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Sometimes',
        value: cigarettes,
        setValue: setCigarette,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
    ];
  }

  List<TilesButton> getInterestsList() {
    return [
      TilesButton(
        title: 'Entrepreneurship',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Travel',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Sports',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Video Games',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Netflix and Chill',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Sunsets',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Music',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Party',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Anime',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Cinema',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Fast food',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Globe-trotter',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Festivals',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'E-sports',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Photography',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
      ),
      TilesButton(
        title: 'Fashion',
        value: widget.profile.value!.interests.join(", "),
        setValue: onSubmitInterests,
        iconData: MdiIcons.nullIcon,
        isArray: false,
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
                    PictureSelectorList(
                      profile: widget.profile,
                    ),
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
                          modalTitle: 'Choose your interests',
                          list: getInterestsList(),
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
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
                            ),
                            TilesButton(
                              title: 'Woman',
                              value: widget.profile.value!.gender,
                              setValue: setGender,
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
                            ),
                            TilesButton(
                              title: 'Transgender',
                              value: widget.profile.value!.gender,
                              setValue: setGender,
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
                            ),
                            TilesButton(
                              title: 'Other',
                              value: widget.profile.value!.gender,
                              setValue: setGender,
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
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
                              title: 'Hetero',
                              value: widget.profile.value!.orientation,
                              setValue: setOrientation,
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
                            ),
                            TilesButton(
                              title: 'Man',
                              value: widget.profile.value!.orientation,
                              setValue: setOrientation,
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
                            ),
                            TilesButton(
                              title: 'Woman',
                              value: widget.profile.value!.orientation,
                              setValue: setOrientation,
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
                            ),
                            TilesButton(
                              title: 'Transgender',
                              value: widget.profile.value!.orientation,
                              setValue: setOrientation,
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
                            ),
                            TilesButton(
                              title: 'Lesbian',
                              value: widget.profile.value!.orientation,
                              setValue: setOrientation,
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
                            ),
                            TilesButton(
                              title: 'Gay',
                              value: widget.profile.value!.orientation,
                              setValue: setOrientation,
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
                            ),
                            TilesButton(
                              title: 'Bisexual',
                              value: widget.profile.value!.orientation,
                              setValue: setOrientation,
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
                            ),
                            TilesButton(
                              title: 'Asexual',
                              value: widget.profile.value!.orientation,
                              setValue: setOrientation,
                              iconData: MdiIcons.nullIcon,
                              isArray: false,
                            ),
                          ],
                          setState: setOrientation,
                          modalTitle: 'Define your sexual orientation',
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
