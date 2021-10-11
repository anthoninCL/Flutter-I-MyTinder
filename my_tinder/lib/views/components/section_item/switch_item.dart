import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/themes/app_theme.dart';

class SwitchSectionItem extends StatefulWidget {
  final String title;
  final bool value;

  const SwitchSectionItem({required this.title, required this.value});

  @override
  _SwitchSectionItemState createState() => _SwitchSectionItemState(
      title: title, value: value
  );

}

class _SwitchSectionItemState extends State<SwitchSectionItem> {
  String title;
  bool value;
  _SwitchSectionItemState({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 24,
        right: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: AppTheme.colors.black,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
            fontSize: 16
        ),
      ),
      trailing: Switch(
        activeColor: AppTheme.colors.primary,
        onChanged: (val) {
          setState(() {
            value = val;
          });
        },
        value: value,
      ),
    );
  }
}