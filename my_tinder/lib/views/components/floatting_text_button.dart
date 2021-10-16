import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class FloattingTextButton extends StatelessWidget {
  final String title;
  final Function setState;

  const FloattingTextButton(
      {required this.title, required this.setState});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          maximumSize: const Size(275, 60),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60))
          ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                AppTheme.colors.primary, AppTheme.colors.secondary
              ]),
          borderRadius: BorderRadius.circular(60)),
        child: Container(
          width: 275,
          height: 60,
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
                color: AppTheme.colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 20
            ),
          ),
        ),
      ),
    );

  }
}

