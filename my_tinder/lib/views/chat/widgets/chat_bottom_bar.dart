import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
        height: 75,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: (){
              },
              child: Icon(Icons.attachment, color: AppTheme.colors.primary, size: 20, ),
            ),
            const SizedBox(width: 15,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.colors.greyBack47,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextField(
                    cursorColor: AppTheme.colors.dark,
                    decoration: InputDecoration(
                        hintText: "Write a message...",
                        border: InputBorder.none,
                      suffixIcon: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.colors.primary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.send,
                          color: AppTheme.colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15,),
          ],

        ),
      ),
    );
  }
}
