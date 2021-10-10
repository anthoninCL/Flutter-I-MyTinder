import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProfileCardFooter extends StatelessWidget {
  final profile;
  final index;
  final controller;
  const ProfileCardFooter({Key? key, required this.profile, required this.index, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 7),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfileDescription(
                  name: "Anne Laure",
                  age: 25,
                  description:
                  "Travel ✈️ Sport and food, Only god can judge me..."),
              //buildChoiceRow(index: index),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileDescription({required String name, required int age, required String description}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(name + "," + age.toString(), style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),),
      const SizedBox(height: 10),
      Text(description, style: const TextStyle(fontSize: 16, color: Colors.white),),
      const SizedBox(height: 20),
    ],
  );

  Future _scrollToIndex(index) async {
    await controller.scrollToIndex(index + 1, preferPosition: AutoScrollPosition.begin);
  }

  /*Widget buildChoiceRow({required index}) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      myFAB(icon: const Icon(Icons.close, size: 30,), onPress: () => _scrollToIndex(index),),
      myFAB(icon: const Icon(Icons.favorite_outline, size: 30, color: Colors.red,), onPress: () => _scrollToIndex(index)),
    ],
  );*/
}
