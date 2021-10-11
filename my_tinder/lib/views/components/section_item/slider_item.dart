import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/themes/app_theme.dart';

class SliderSectionItem extends StatefulWidget {
  final String title;
  final double value;

  const SliderSectionItem({
    required this.title,
    required this.value});

  @override
  _SliderSectionItemState createState() => _SliderSectionItemState(
      title: title, value: value
  );

}

class _SliderSectionItemState extends State<SliderSectionItem> {
  String title;
  double value;

  _SliderSectionItemState({
    required this.title,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 24,
        right: 20,
        top: 10
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
        '${value.round().toString()} km',
        style: TextStyle(
            color: AppTheme.colors.grey,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
            fontSize: 16
        ),
      ),
      subtitle: Slider(
        activeColor: AppTheme.colors.primary,
        value: value,
        min: 0,
        max: 100,
        divisions: 100,
        label: value.round().toString(),
        onChanged: (double _value) {
          setState(() {
          value = _value;
          });
        },
      ),
    );
  }
}