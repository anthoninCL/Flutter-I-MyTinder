import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_tinder/models/profile.dart';

class Match {
  final String name;
  final List<String> images;
  final num age;
  final String bio;
  final String city;
  final String distance;
  final List<Lifestyle> interests;
  final List<Lifestyle> lifestyles;

  Match(
    this.name,
    this.images,
    this.age,
    this.bio,
    this.city,
    this.distance,
    this.interests,
    this.lifestyles,
  );

  Match.from(ProfileModel profile)
      : this(
          profile.username,
          profile.images,
          profile.age,
          profile.bio,
          profile.city,
          "0 km",
          [
            Lifestyle(
                "zodianSign", profile.zodiacSign, false, MdiIcons.weatherNight),
            Lifestyle("food", profile.food, false, MdiIcons.foodForkDrink),
            Lifestyle("pet", profile.pet, false, MdiIcons.paw),
            Lifestyle(
                "socialNetwork", profile.socialNetwork, false, MdiIcons.web),
            Lifestyle("sport", profile.sport, false, MdiIcons.basketball),
            Lifestyle("drinks", profile.drinks, false, MdiIcons.glassCocktail),
            Lifestyle("cigarettes", profile.cigarettes, false, MdiIcons.cigar),
          ],
          profile.interests.map((interest) {
            return Lifestyle(interest, interest);
          }).toList(),
        );
}

class Lifestyle {
  final String type;
  final String value;
  final IconData icon;
  final bool isSelected;

  Lifestyle(this.type, this.value,
      [this.isSelected = false, this.icon = MdiIcons.nullIcon]);
}
