import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

import 'floatting_text_button.dart';

bottomModal(context, title, list) {
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
                  child: Padding(
                  padding: const EdgeInsets.all(30.0),
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
                ),
                Expanded(
                  child: Row(
                    // TODO: style in order to set tiles at the top
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for(var item in list ) item
                    ],
                  ),
                ),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child :FloattingTextButton(title: 'Finish'),
                  )

                )
              ],
            ),
        )
      )
    )
  );
}
