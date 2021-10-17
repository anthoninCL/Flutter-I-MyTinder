import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_tinder/models/profile.dart';
import 'package:my_tinder/views/profile/profile_portrait_footer.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ProfileModel> loadProfile() async {
  SharedPreferences s = await SharedPreferences.getInstance();
  return ProfileModel(
      s.getString("username") ?? "John",
      s.getInt("age") ?? 24,
      s.getString("bio") ?? "Positive attitude is the key of success 🔑",
      s.getString("phoneNumber") ?? "06 34 56 39 45",
      s.getString("email") ?? "john.doe@gmail.com",
      s.getString("ageRange") ?? "18-25",
      s.getString("wantToMeet") ?? "Girls",
      s.getInt("range") ?? 10,
      s.getStringList("images") ?? ["assets/images/main_profile_pic.jpg"],
      s.getString("zodiac sign") ?? "Aries",
      s.getString("food") ?? "Vegan",
      s.getString("pet") ?? "Cat",
      s.getString("social network") ?? "Facebook",
      s.getString("sport") ?? "Gym",
      s.getString("drinks") ?? "Gin and Tonic",
      s.getString("cigarettes") ?? "Unspecified",
      s.getStringList("interests") ??
          ["Travel", "Sports", "Entrepreneurship", "Globe-trotter"],
      s.getString("city") ?? "Paris, France",
      s.getString("gender") ?? "Male",
      s.getString("orientation") ?? "Hetero");
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ValueNotifier<ProfileModel?> profile = ValueNotifier<ProfileModel?>(null);
  bool isLoading = true;
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadProfile().then((value) {
      print("Finished loading profile");
      setState(() {
        profile.value = value;
        isLoading = false;
      });
    });
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  imgFromCamera() async {
    SharedPreferences s = await SharedPreferences.getInstance();

    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      profile.value!.images[0] = image.path;
      s.setStringList("images", profile.value!.images);
      setState(() {
        _image = image;
      });
    }
  }

  imgFromGallery() async {
    SharedPreferences s = await SharedPreferences.getInstance();

    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image != null) {
      profile.value!.images[0] = image.path;
      s.setStringList("images", profile.value!.images);
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : ValueListenableBuilder<ProfileModel?>(
            valueListenable: profile,
            builder: (context, value, child) {
              return Stack(children: [
                profile.value!.images[0].substring(0, 6) != "assets"
                    ? Image.file(
                        File(profile.value!.images[0]),
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      )
                    : Image.asset(
                        profile.value!.images[0],
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile.value!.city,
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          ProfilePortraitFooter(
                            profile: profile,
                            showPicker: () => showPicker(context),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]);
            });
  }
}
