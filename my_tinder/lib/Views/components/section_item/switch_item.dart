import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/themes/app_theme.dart';

import 'item.dart';

class SwitchSectionItem extends StatefulWidget implements SectionItem {
  final String title;
  final bool value;

  const SwitchSectionItem({required this.title, required this.value});

  @override
  _SwitchSectionItemState createState() => _SwitchSectionItemState(
      title: title, value: value
  );

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      title,
      style: AppTheme.textStyles.headline1,
    );
  }

  Widget buildTrailing(BuildContext context) {
    return Container();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return ListTile(
      title: buildTitle(context),
      trailing: buildTrailing(context),
    );
  }

}

class _SwitchSectionItemState extends State<SwitchSectionItem> {
  String title;
  bool value;
  _SwitchSectionItemState({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
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