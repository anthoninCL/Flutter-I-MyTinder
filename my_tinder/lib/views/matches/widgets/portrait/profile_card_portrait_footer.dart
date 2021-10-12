import 'package:flutter/material.dart';
import 'package:my_tinder/constants/matches.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ProfileCardPortraitFooter extends StatelessWidget {
  final Match profile;
  final int index;
  final AutoScrollController controller;

  const ProfileCardPortraitFooter(
      {Key? key,
      required this.profile,
      required this.index,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 7),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfileDescription(
                  name: profile.name,
                  age: profile.age,
                  description: profile.bio),
              buildChoiceRow(index: index),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileDescription(
          {required String name,
          required num age,
          required String description}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name + ", " + age.toString(),
            style: const TextStyle(
                fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 20),
        ],
      );

  Future _scrollToIndex(index) async {
    await controller.scrollToIndex(index + 1,
        preferPosition: AutoScrollPosition.begin);
  }

  Widget buildChoiceRow({required index}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () => _scrollToIndex(index),
            child: const Icon(
              Icons.close,
              size: 30,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
          FloatingActionButton(
            onPressed: () => _scrollToIndex(index),
            child: const Icon(
              Icons.favorite_outline,
              size: 30,
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
          ),
        ],
      );
}
