import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class LogoText extends StatelessWidget {
  final String text;
  final IconData icon;

  const LogoText({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: AppTheme.colors.grey,
        ),
        Container(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: AppTheme.colors.grey),
          ),
        ),
      ],
    );
  }
}
