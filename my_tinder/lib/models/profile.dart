class ProfileModel {
  String username;
  int age;
  String bio;
  String phoneNumber;
  String email;
  String ageRange;
  String wantToMeet;
  int range;
  List<String> images;
  String zodiacSign;
  String food;
  String pet;
  String socialNetwork;
  String sport;
  String drinks;
  String cigarettes;
  List<String> interests;
  String city;
  String gender;
  String orientation;

  ProfileModel(this.username,
      this.age,
      this.bio,
      this.phoneNumber,
      this.email,
      this.ageRange,
      this.wantToMeet,
      this.range,
      this.images,
      this.zodiacSign,
      this.food,
      this.pet,
      this.socialNetwork,
      this.sport,
      this.drinks,
      this.cigarettes,
      this.interests,
      this.city,
      this.gender,
      this.orientation);

  ProfileModel.from(ProfileModel profile)
      : this(
      profile.username,
      profile.age,
      profile.bio,
      profile.phoneNumber,
      profile.email,
      profile.ageRange,
      profile.wantToMeet,
      profile.range,
      profile.images,
      profile.zodiacSign,
      profile.food,
      profile.pet,
      profile.socialNetwork,
      profile.sport,
      profile.drinks,
      profile.cigarettes,
      profile.interests,
      profile.city,
      profile.gender,
      profile.orientation);
}
