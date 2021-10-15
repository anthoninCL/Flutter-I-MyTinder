import 'package:flutter/material.dart';
import 'package:my_tinder/Models/profile.dart';

class TextInputSectionItem extends StatefulWidget {
  ValueNotifier<ProfileModel?> profile;
  final Function onSubmit;

  TextInputSectionItem({required this.profile, required this.onSubmit});

  @override
  _TextInputSectionItemState createState() => _TextInputSectionItemState();

}

class _TextInputSectionItemState extends State<TextInputSectionItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 20,
        bottom: 5,
      ),
      child: SizedBox(
        child: TextField(
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.go,
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.profile.value!.bio,
          ),
          maxLength: 500,
          onSubmitted: (String value) {
            widget.onSubmit(value);
          },
        ),
      ),
    );
  }
}
