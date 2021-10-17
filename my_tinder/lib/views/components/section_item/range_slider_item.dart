import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/themes/app_theme.dart';

class RangeSliderSectionItem extends StatefulWidget {
  final String title;
  final RangeValues values;
  final Function setState;

  const RangeSliderSectionItem(
      {required this.title, required this.values, required this.setState});

  @override
  _RangeSliderSectionItemState createState() => _RangeSliderSectionItemState();
}

class _RangeSliderSectionItemState extends State<RangeSliderSectionItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 24, right: 20, top: 10),
      title: Text(
        widget.title,
        style: TextStyle(
            color: AppTheme.colors.black,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
            fontSize: 16),
      ),
      trailing: Text(
        '${widget.values.start.round().toString()} - ${widget.values.end.round().toString()}',
        style: TextStyle(
            color: AppTheme.colors.grey,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
            fontSize: 16),
      ),
      subtitle: RangeSlider(
        activeColor: AppTheme.colors.primary,
        values: widget.values,
        min: 18,
        max: 50,
        divisions: 50,
        labels: RangeLabels(
          widget.values.start.round().toString(),
          widget.values.end.round().toString(),
        ),
        onChanged: (RangeValues _values) {
          widget.setState(_values);
        },
      ),
    );
  }
}
