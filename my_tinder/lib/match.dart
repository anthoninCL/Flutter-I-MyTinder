import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_tinder/Views/matches/matches.dart';
import 'package:my_tinder/Views/messages/messages.dart';
import 'package:my_tinder/Views/profile/profile.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Match',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    backgroundColor: Colors.black.withOpacity(0.4),
    elevation: 1,
    selectedItemColor: Colors.white,
    unselectedItemColor: const Color(0xCCCCCCCC),
  );
}
