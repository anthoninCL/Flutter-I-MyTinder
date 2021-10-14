import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderBar({required this.title});

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
            // TODO: SAVE ALL DATAS
            Navigator.pop(context);
          },
          child: const Text('Finish'),
        ),
      ],
    );
  }

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(40);
}