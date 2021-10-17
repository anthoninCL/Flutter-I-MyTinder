import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/shared/widgets/button.dart';
import 'package:my_tinder/themes/app_theme.dart';

import '../modal.dart';

class SelectionSectionItem extends StatefulWidget {
  final String title;
  final String value;
  final String modalTitle;
  final List<TilesButton> list;
  final Function setState;

  const SelectionSectionItem(
      {
        required this.title,
        required this.value,
        required this.setState,
        required this.modalTitle,
        required this.list,
      });

  @override
  _SelectionSectionItemState createState() => _SelectionSectionItemState();

}

class _SelectionSectionItemState extends State<SelectionSectionItem> {
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
