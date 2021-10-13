import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/themes/app_theme.dart';

class RangeSliderSectionItem extends StatefulWidget {
  final String title;
  final RangeValues values;

  const RangeSliderSectionItem({
    required this.title,
    required this.values});

  @override
  _RangeSliderSectionItemState createState() => _RangeSliderSectionItemState(
      title: title, values: values
  );
}

class _RangeSliderSectionItemState extends State<RangeSliderSectionItem> {
  String title;
  RangeValues values;

  _RangeSliderSectionItemState({
    required this.title,
    required this.values
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
        '${values.start.round().toString()} - ${values.end.round().toString()}',
        style: TextStyle(
            color: AppTheme.colors.grey,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
            fontSize: 16
        ),
      ),
      subtitle: RangeSlider(
        activeColor: AppTheme.colors.primary,
        values: values,
        min: 18,
        max: 50,
        divisions: 50,
        labels: RangeLabels(
          values.start.round().toString(),
          values.end.round().toString(),
        ),
        onChanged: (RangeValues _values) {
          setState(() {
            values = _values;
          });
        },
      ),

    );
  }
}