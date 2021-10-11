import 'package:flutter/material.dart';
import 'package:my_tinder/shared/widgets/clickable_avatar.dart';
import 'package:my_tinder/themes/app_theme.dart';

class ConversationHeader extends StatelessWidget {
  const ConversationHeader({Key? key, required this.image, required this.name}) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(
                      Icons.arrow_back,
                      color: AppTheme.colors.primary
                  ),
                ),
              ),
            ),
            ClickableAvatar(
              radius: 30,
              image: image,
              name: name,
            ),
            Expanded(child: Container(width: 24,))
          ],
        ),
      ),
    );
  }
}
