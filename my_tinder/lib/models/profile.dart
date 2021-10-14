class ProfileModel {
  final String username;
  final int age;
  final String bio;
  final List<String> images;
  final List<String> lifestyles;
  final List<String> interests;
  final String city;
  final String gender;
  final String orientation;

  ProfileModel(this.username, this.age, this.bio, this.images, this.lifestyles,
      this.interests, this.city, this.gender, this.orientation);
}
