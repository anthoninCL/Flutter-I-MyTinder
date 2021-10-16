import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
}

class Lifestyle {
  final String type;
  final String value;
  final IconData icon;
  final bool isSelected;

  Lifestyle(this.type, this.value,
      [this.isSelected = false, this.icon = MdiIcons.nullIcon]);
}
