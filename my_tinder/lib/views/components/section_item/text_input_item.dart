import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextInputSectionItem extends StatefulWidget {
  final String value;

  const TextInputSectionItem({required this.value});

  @override
  _TextInputSectionItemState createState() => _TextInputSectionItemState(
      value: value
  );

}

class _TextInputSectionItemState extends State<TextInputSectionItem> {
  String value;
  _TextInputSectionItemState({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 20,
        bottom: 5,
      ),
      child: const SizedBox(
        child: TextField(
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.go,
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter a description',
          ),
          maxLength: 500,
        ),
      ),
    );
  }
}
