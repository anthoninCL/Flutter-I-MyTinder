import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/themes/app_theme.dart';

import 'item.dart';

class TitleSectionItem extends StatelessWidget implements SectionItem {
  final String? title;

  const TitleSectionItem(this.title);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(
        color: AppTheme.colors.grey,
        fontWeight: FontWeight.normal,
        fontFamily: 'Roboto',
        fontSize: 14
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return ListTile(
      title: buildTitle(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildWidget(context);
  }

}