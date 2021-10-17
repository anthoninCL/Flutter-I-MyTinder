import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/shared/widgets/button.dart';
import 'package:my_tinder/themes/app_theme.dart';

import '../modal.dart';

class IconSectionItem extends StatefulWidget {
  final String title;
  final String value;
  final Icon icon;
  final String modalTitle;
  final List<TilesButton> list;
  final Function setState;

  const IconSectionItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.setState,
    required this.modalTitle,
    required this.list,
  });

  @override
  _IconSectionItemState createState() => _IconSectionItemState();
}

class _IconSectionItemState extends State<IconSectionItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          bottomModal(context, widget.modalTitle, widget.list, widget.setState, widget.value);
        },
        child : ListTile(
          contentPadding: const EdgeInsets.only(
            left: 24,
            right: 20,
          ),
          leading: widget.icon,
          title: Text(
            widget.title,
            style: TextStyle(
              color: AppTheme.colors.black,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',
              fontSize: 16
            ),
          ),
          trailing: Text(
            widget.value,
            style: TextStyle(
              color: AppTheme.colors.grey,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',
              fontSize: 16
            ),
          ),
        )
    );
  }
}
