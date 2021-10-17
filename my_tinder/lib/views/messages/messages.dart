import 'package:flutter/material.dart';
import 'package:my_tinder/models/messages.dart';
import 'package:my_tinder/models/new_matches.dart';
import 'package:my_tinder/shared/widgets/search_bar.dart';
import 'package:my_tinder/themes/app_theme.dart';
import 'package:my_tinder/constants/index.dart';
import 'package:my_tinder/views/messages/widgets/messages_list.dart';
import 'package:my_tinder/views/messages/widgets/new_matches_list.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<NewMatches> newMatchesDataList = List.from(Constants.newMatches);
  List<Conversation> newConversationDataList = List.from(Constants.messages);

  final TextEditingController _textController = TextEditingController();

  onItemChanged(String value) {
    setState(() {
      newMatchesDataList = Constants.newMatches
          .where((match) => match.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
    setState(() {
      newConversationDataList = Constants.messages
          .where((conversation) => conversation.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  onClear() {
    setState(() {
      newMatchesDataList = Constants.newMatches;
    });
    setState(() {
      newConversationDataList = Constants.messages;
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/profile_pic_1.jpg"), context);
    precacheImage(const AssetImage("assets/images/profile_pic_2.jpg"), context);
    precacheImage(const AssetImage("assets/images/profile_pic_3.jpg"), context);
    precacheImage(const AssetImage("assets/images/profile_pic_4.jpg"), context);
    precacheImage(const AssetImage("assets/images/profile_pic_5.jpg"), context);
    precacheImage(const AssetImage("assets/images/profile_pic_6.jpg"), context);
    precacheImage(const AssetImage("assets/images/profile_pic_7.jpg"), context);
    precacheImage(const AssetImage("assets/images/profile_pic_8.jpg"), context);
    precacheImage(const AssetImage("assets/images/profile_pic_9.jpg"), context);
    precacheImage(const AssetImage("assets/images/profile_pic_10.jpg"), context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SearchBar(
                  onValueChanged: onItemChanged,
                  textController: _textController,
                  hintText: "Search someone...",
                  onClear: onClear,
                )
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'New matches',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    color: AppTheme.colors.primary
                  ),
                ),
              ),
              SizedBox(
                height: newMatchesDataList.isEmpty ? 50.0 : 120.0,
                width: double.infinity,
                child: NewMatchesList(matches: newMatchesDataList)
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 20),
                child: Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    color: AppTheme.colors.primary
                  ),
                ),
              ),
              MessagesList(conversations: newConversationDataList)
            ],
          ),
        )
      ),
    );
  }
}
