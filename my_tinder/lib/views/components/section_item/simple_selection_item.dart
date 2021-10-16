import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/models/profile.dart';
import 'package:my_tinder/shared/widgets/button.dart';
import 'package:my_tinder/themes/app_theme.dart';

import '../modal.dart';

class SimpleSelectionSectionItem extends StatefulWidget {
  ValueNotifier<ProfileModel?> profile;
  final String value;
  final String modalTitle;
  final List<TilesButton> list;
  final Function setState;

  SimpleSelectionSectionItem({Key? key,
    required this.profile,
    required this.value,
    required this.setState,
    required this.modalTitle,
    required this.list
  }) : super(key: key);

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
        onTap: () {
          bottomModal(context, widget.modalTitle, widget.list, widget.setState);
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
