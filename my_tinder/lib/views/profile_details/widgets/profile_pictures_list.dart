import 'dart:io';

import 'package:flutter/material.dart';

class ProfilePicturesList extends StatelessWidget {
  final List<String> images;

  const ProfilePicturesList({required this.images, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 2,
      spacing: 2,
      children: images.map((picture) {
        return picture.substring(0, 6) == "assets"
            ? Image.asset(
                picture,
                width: 125,
                height: 125,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(picture),
                width: 125,
                height: 125,
                fit: BoxFit.cover,
              );
      }).toList(),
    );
  }
}
