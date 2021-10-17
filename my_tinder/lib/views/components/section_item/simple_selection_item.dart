import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/models/profile.dart';
import 'package:my_tinder/themes/app_theme.dart';

class SimpleSelectionSectionItem extends StatefulWidget {
  ValueNotifier<ProfileModel?> profile;
  final String value;
  final Function onSubmit;
  SimpleSelectionSectionItem({required this.profile, required this.value, required this.onSubmit});

  @override
  _SimpleSelectionSectionItemState createState() =>
      _SimpleSelectionSectionItemState();
}

class _SimpleSelectionSectionItemState
    extends State<SimpleSelectionSectionItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // TODO: Open la bonne modale + renvoyer la valeur set dans la modale
        // + Transform le tableau de value en plusieurs
        onTap: () {
        },
        child: ListTile(
          contentPadding: const EdgeInsets.only(
            left: 24,
            right: 20,
          ),
          title: Text(
            widget.value,
            style: TextStyle(
                color: AppTheme.colors.grey,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
                fontSize: 16),
          ),
        ));
  }
}
