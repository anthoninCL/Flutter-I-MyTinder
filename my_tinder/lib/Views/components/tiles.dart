import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Tiles extends StatelessWidget {
  final String name;
  final bool isSelected;
  final bool hasIcon;
  final IconData icon;

  const Tiles(
      {Key? key,
      required this.name,
      required this.isSelected,
      required this.hasIcon,
      this.icon = MdiIcons.nullIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              color:
                  isSelected ? AppTheme.colors.primary : AppTheme.colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasIcon == true)
                Row(
                  children: [
                    Icon(
                      icon,
                      color: isSelected == true
                          ? AppTheme.colors.primary
                          : AppTheme.colors.grey,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              Text(
                name,
                style: TextStyle(
                    color: isSelected
                        ? AppTheme.colors.primary
                        : AppTheme.colors.grey),
              ),
            ],
          ),
        ));
  }
}
