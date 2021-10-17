import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class PictureSelector extends StatefulWidget {
  const PictureSelector(
      {Key? key, required this.onPressed, this.image, required this.isActive})
      : super(key: key);

  final VoidCallback onPressed;
  final bool isActive;
  final String? image;

  @override
  State<PictureSelector> createState() => _PictureSelectorState();
}

class _PictureSelectorState extends State<PictureSelector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.isActive
                ? AppTheme.colors.greyBack47
                : AppTheme.colors.greyLight50,
            border: widget.image != null
                ? null
                : Border.all(color: AppTheme.colors.greyLight)),
        child: widget.image != null
            ? widget.image!.substring(0, 6) != "assets"
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(
                      File(widget.image!),
                      fit: BoxFit.cover,
                      height: 150,
                      width: 100,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.image!,
                      fit: BoxFit.cover,
                      height: 150,
                      width: 100,
                    ),
                  )
            : widget.isActive
                ? Align(
                    child: Container(
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: AppTheme.colors.white,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.colors.primary,
                        shape: BoxShape.circle,
                      ),
                      height: 30,
                      width: 30,
                    ),
                  )
                : null,
      ),
      onTap: widget.isActive ? widget.onPressed : () => {},
    );
  }
}
