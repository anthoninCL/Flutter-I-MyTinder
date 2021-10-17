import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_tinder/views/profile_details/widgets/logo_text.dart';

class Localization extends StatelessWidget {
  final String location;
  final String distance;

  const Localization({
    Key? key,
    required this.location,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 2,
      ),
      child: Column(
        children: [
          LogoText(
            text: location,
            icon: MdiIcons.city,
          ),
          const SizedBox(height: 5),
          LogoText(
            text: distance,
            icon: MdiIcons.mapMarker,
          ),
        ],
      ),
    );
  }
}
