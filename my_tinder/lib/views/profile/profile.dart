import 'package:flutter/material.dart';
import 'package:my_tinder/views/components/modal.dart';
import 'package:my_tinder/views/components/tiles.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static const List<Tiles> list = [
    Tiles(name: 'Geminy', isSelected: true),
    Tiles(name: 'Leo', isSelected: false),
    Tiles(name: 'Aries', isSelected: false),
    Tiles(name: 'Taurus', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded (
              child: TextButton (
                  onPressed: () {
                    bottomModal(context, "What’s your zodiac sign?", list);
                  },
                  child: const Text("Show modal")
              ),
            ),
          ],
        ),
      ),
    );
  }
}
