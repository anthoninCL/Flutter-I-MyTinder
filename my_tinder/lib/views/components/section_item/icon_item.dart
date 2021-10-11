import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/themes/app_theme.dart';

class IconSectionItem extends StatefulWidget {
  final String title;
  final String value;
  final Icon icon;

  const IconSectionItem({required this.title, required this.value, required this.icon});

  @override
  _IconSectionItemState createState() => _IconSectionItemState(
      title: title, value: value, icon: icon
  );
}

class _IconSectionItemState extends State<IconSectionItem> {
  String title;
  String value;
  Icon icon;
  _IconSectionItemState({required this.title, required this.value, required this.icon});

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
          leading: icon,
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
