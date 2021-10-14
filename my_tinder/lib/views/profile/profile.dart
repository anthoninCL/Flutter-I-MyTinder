import 'package:flutter/material.dart';
import 'package:my_tinder/Models/profile.dart';
import 'package:my_tinder/views/profile/profile_portrait_footer.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ProfileModel> _loadProfile() async {
  SharedPreferences s = await SharedPreferences.getInstance();
  return ProfileModel(
      s.getString("username")!,
      s.getInt("age")!,
      s.getString("bio")!,
      s.getStringList("images")!,
      s.getStringList("lifestyles")!,
      s.getStringList("interests")!,
      s.getString("city")!,
      s.getString("gender")!,
      s.getString("orientation")!);
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileModel? profile;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile().then((value) {
      setState(() {
        profile = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Stack(children: [
            Image.asset(
              profile!.images[0],
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
                        profile!.city,
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      ProfilePortraitFooter(
                        profile: profile!,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]);
  }
}
