import 'dart:developer';

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
        style: AppTheme.textStyles.headline4,
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