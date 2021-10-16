import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function onPress;

  const HeaderBar({required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.colors.white,
      toolbarHeight: 40,
      title: Text(
        title,
        style: TextStyle(
            color: AppTheme.colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
            fontSize: 18
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(primary: AppTheme.colors.primary),
          onPressed: () {
            onPress();
            Navigator.pop(context);
          },
          child: const Text('Finish'),
        ),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}