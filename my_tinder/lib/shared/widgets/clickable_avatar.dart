import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ClickableAvatar extends StatelessWidget {
  const ClickableAvatar({
    Key? key,
    required this.image,
    required this.radius,
    this.name,
    this.onTap
  }) : super(key: key);

  final String image;
  final String? name;
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(image),
          ),
        ),
        if (name != null) const SizedBox(height: 5),
        if (name != null) Text(
          name!,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto')
          ,)
      ],
    );
  }
}