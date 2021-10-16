import 'package:flutter/cupertino.dart';

class Match {
  final String name;
  final List<String> images;
  final num age;
  final String bio;
  final String city;
  final String distance;
  final List<String> interests;
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

  Lifestyle(this.type, this.icon, this.value);
}