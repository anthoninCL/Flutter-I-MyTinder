import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/themes/app_theme.dart';

import 'item.dart';

class SimpleSectionItem extends StatelessWidget implements SectionItem {
  final String? title;

  const SimpleSectionItem(this.title);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(
        color: AppTheme.colors.black,
        fontWeight: FontWeight.normal,
        fontFamily: 'Roboto',
        fontSize: 16
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 24,
        right: 20,
      ),
      title: buildTitle(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildWidget(context);
  }

}