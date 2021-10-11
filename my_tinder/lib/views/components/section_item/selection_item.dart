import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/themes/app_theme.dart';

class SelectionSectionItem extends StatefulWidget {
  final String title;
  final String value;

  const SelectionSectionItem({required this.title, required this.value});

  @override
  _SelectionSectionItemState createState() => _SelectionSectionItemState(
    title: title, value: value
  );

}

class _SelectionSectionItemState extends State<SelectionSectionItem> {
  String title;
  String value;
  _SelectionSectionItemState({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // TODO: Open la bonne modale + renvoyer la valeur set dans la modale
        onTap: () {
          setState(() {
            value = "Oui";
          });
        },
        child : ListTile(
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
          trailing: Text(
            value,
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
