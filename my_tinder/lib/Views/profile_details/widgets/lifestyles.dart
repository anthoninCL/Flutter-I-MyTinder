import 'package:flutter/material.dart';
import 'package:my_tinder/views/profile_details/widgets/profile_description.dart';
import '../../components/tiles.dart';

class UserLifeStyles extends StatelessWidget {
  final List<LifeStyle> lifeStyleArray;
  const UserLifeStyles({Key? key, required this.lifeStyleArray})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        right: 10,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          runSpacing: 8,
          spacing: 8,
          children: lifeStyleArray.map(
            (lifestyle) {
              return Tiles(
                name: lifestyle.value,
                isSelected: lifestyle.isSelected,
                icon: lifestyle.icon,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
