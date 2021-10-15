import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_tinder/models/messages.dart';
import 'package:my_tinder/shared/widgets/clickable_avatar.dart';
import 'package:my_tinder/themes/app_theme.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    Key? key,
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.onTap
  }) : super(key: key);

  final String name;
  final String image;
  final Message lastMessage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: <Widget>[
            ClickableAvatar(image: image, radius: 40),
            const SizedBox(width: 10.0),
            Expanded(
              child: SizedBox(
                height: 85,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: AppTheme.colors.greyLight))
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: Text(
                                name,
                                style: TextStyle(
                                  color: AppTheme.colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (lastMessage.sendByMe) Padding(
                                  padding: const EdgeInsets.only(top: 5,right: 10.0),
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                      decoration: BoxDecoration(
                                        color: AppTheme.colors.primary,
                                        shape: BoxShape.circle,
                                      )
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.65,
                                  child: Text(
                                    lastMessage.content,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: AppTheme.colors.grey,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}