import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_tinder/views/matches/matches.dart';
import 'package:my_tinder/views/messages/messages.dart';
import 'package:my_tinder/views/profile/profile.dart';
import 'package:my_tinder/themes/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Match',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textStyles,

      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final screens = [Matches(), Messages(), Profile()];

  Future<bool> addProfileToLocaleStore() async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
    sPref.setString("username", "John");
    sPref.setInt("age", 24);
    sPref.setString("bio", "Positive attitude is the key of success 🔑");
    sPref.setStringList("images", ["assets/images/main_profile_pic.jpg"]);
    sPref.setStringList("lifestyles", [
      "zodiac sign.Aries",
      "food.Vegan",
      "pet.Cat",
      "social network.Unspecified",
      "sport.Gym",
      "drinks.Gyn Tonic",
      "cigarettes.Unspecified"
    ]);
    sPref.setStringList("interests", ["Travel", "Sports", "Entrepreneurship", "Globe-trotter"]);
    sPref.setString("city", "Paris, France");
    sPref.setString("gender", "Male");
    sPref.setString("orientation", "Hetero");
    return true;
  }

  @override
  void initState() {
    super.initState();
    addProfileToLocaleStore().then((value) => print("value: $value"));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
          child: IndexedStack(
            index: _selectedIndex,
            children: screens,
          )
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() => BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: _selectedIndex == 0 ? SvgPicture.asset("assets/icons/main-icon.svg", height: 22) : SvgPicture.asset("assets/icons/main-icon-outline.svg", height: 22), label: ""),
      BottomNavigationBarItem(icon: _selectedIndex == 1 ? const Icon(FontAwesomeIcons.solidCommentDots) : const Icon(FontAwesomeIcons.commentDots), label: ""),
      BottomNavigationBarItem(icon: _selectedIndex == 2 ? const Icon(Icons.person) : const Icon(Icons.person_outline), label: "")
    ],
    currentIndex: _selectedIndex,
    onTap: _onItemTapped,
    backgroundColor: AppTheme.colors.black40,
    elevation: 1,
    selectedItemColor: AppTheme.colors.white,
    unselectedItemColor: AppTheme.colors.greyLight,
    // above could be used AppTheme.colors.greyLight
    // and for a text it will be Theme.of(context).textTheme.headline6,
  );
}
