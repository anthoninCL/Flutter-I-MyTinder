import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_tinder/themes/app_theme.dart';

class ProfileCardLandscapeHeader extends StatelessWidget {
  final String name;
  final num age;
  final String city;
  final String distance;

  const ProfileCardLandscapeHeader(
      {Key? key,
      required this.name,
      required this.age,
      required this.city,
      required this.distance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitleContent(name: name, age: age),
        _buildLocation(iconData: MdiIcons.city, value: city),
        _buildLocation(iconData: MdiIcons.mapMarker, value: distance),
      ],
    );
  }

  Widget _buildLocation({required iconData, required value}) => Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Icon(iconData, color: AppTheme.colors.grey, size: 20),
      ),
      Text(value, style: AppTheme.textStyles.headline6,)
    ],
  );

  Widget _buildTitleContent({required name, required age}) => Row(
    children: [
      RichText(
        text: TextSpan(
            text: name,
            style: AppTheme.textStyles.textTheme.headline1!
                .merge(const TextStyle(color: Colors.black)),
            children: [
              TextSpan(
                  text: " " + age.toString(),
                  style: AppTheme.textStyles.textTheme.headline3!
                      .merge(const TextStyle(color: Colors.black)))
            ]),
      )
    ],
  );
}
