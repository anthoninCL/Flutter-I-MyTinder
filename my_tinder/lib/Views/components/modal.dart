import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

import 'floatting_text_button.dart';

bottomModal(context, title) {
  return (showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius:
            BorderRadius.vertical(top: Radius.circular(20.0))
      ),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: AppTheme.colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 25
                    ),
                  ),
                ),
                const Expanded(
                  child: Text('Lalala')
                ),
                const Flexible(
                  child: FloattingTextButton(title: 'Finish'),
                )
              ],
            ),
        )
      )
    )
  );
}
