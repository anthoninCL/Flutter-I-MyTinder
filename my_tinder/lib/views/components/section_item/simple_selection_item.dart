import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/themes/app_theme.dart';

class SimpleSelectionSectionItem extends StatefulWidget {
  final String value;

  const SimpleSelectionSectionItem({required this.value});

  @override
  _SimpleSelectionSectionItemState createState() => _SimpleSelectionSectionItemState(
    value: value
  );

}

class _SimpleSelectionSectionItemState extends State<SimpleSelectionSectionItem> {
  String value;
  _SimpleSelectionSectionItemState({required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // TODO: Open la bonne modale + renvoyer la valeur set dans la modale
        // + Transform le tableau de value en plusieurs
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
