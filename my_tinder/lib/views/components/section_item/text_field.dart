import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class TextFieldSection extends StatefulWidget {
  final String title;
  final String value;
  final Function setState;
  const TextFieldSection({Key? key, required this.title, required this.value, required this.setState}) : super(key: key);

  @override
  _TextFieldSectionState createState() => _TextFieldSectionState();
}

class _TextFieldSectionState extends State<TextFieldSection> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 24,
        right: 20,
      ),
      title: Text(widget.title,
          style: TextStyle(
              color: AppTheme.colors.black,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',
              fontSize: 16)),
      trailing: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: TextField(
          textAlign: TextAlign.right,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.value,
          ),
          onChanged: (value) {
            widget.setState(value);
          },
        ),
      ),
    );
  }
}
