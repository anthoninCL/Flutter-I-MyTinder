import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_tinder/themes/app_theme.dart';

class SliderSectionItem extends StatefulWidget {
  final String title;
  final double value;
  final Function setState;

  const SliderSectionItem(
      {required this.title, required this.value, required this.setState});

  @override
  _SliderSectionItemState createState() => _SliderSectionItemState();
}

class _SliderSectionItemState extends State<SliderSectionItem> {
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
        '${widget.value.round().toString()} km',
        style: TextStyle(
            color: AppTheme.colors.grey,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
            fontSize: 16),
      ),
      subtitle: Slider(
        activeColor: AppTheme.colors.primary,
        value: widget.value,
        min: 0,
        max: 100,
        divisions: 100,
        label: widget.value.round().toString(),
        onChanged: (double _value) {
          widget.setState(_value);
        }
      ),
    );
  }
}
