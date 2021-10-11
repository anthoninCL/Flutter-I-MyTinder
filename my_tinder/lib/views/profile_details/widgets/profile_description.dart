import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_tinder/views/profile_details/widgets/localization.dart';
import 'package:my_tinder/views/profile_details/widgets/logo_text.dart';

class ProfileDescription extends StatelessWidget {
  const ProfileDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                "Anne Laure",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "25",
                style: TextStyle(fontSize: 27),
              ),
            ],
          ),
          const Localization(
            location: "Tour Eiffel",
            distance: "2km",
          ),
        ],
      ),
    );
  }
}
