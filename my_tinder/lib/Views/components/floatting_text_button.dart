import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class FloattingTextButton extends StatelessWidget {
  final String title;
  const FloattingTextButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // TODO: SEND DATAS
          print('Hi there');
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

