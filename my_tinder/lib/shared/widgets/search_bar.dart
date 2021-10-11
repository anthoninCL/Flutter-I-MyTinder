import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key, this.onValueChanged, required this.textController, required this.hintText, required this.onClear,
  }) : super(key: key);

  final void Function(String)? onValueChanged;
  final VoidCallback? onClear;
  final String hintText;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.greyBack47,
        borderRadius: BorderRadius.circular(50)
      ),
      child: TextField(
        controller: textController,
        cursorColor: AppTheme.colors.dark,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: AppTheme.colors.grey),
          border: InputBorder.none,
          hintText: hintText,
          suffixIcon: IconButton(
            splashColor: AppTheme.colors.white0,
            onPressed: onClear,
            icon: Icon(Icons.clear, color: AppTheme.colors.grey),
          ),
        ),
        onChanged: onValueChanged,
      ),
    );
  }
}