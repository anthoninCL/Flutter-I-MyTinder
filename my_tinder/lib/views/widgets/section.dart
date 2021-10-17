import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class Section extends StatelessWidget {
  final List<Widget> itemList;

  const Section({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: itemList.length + 1,
        itemBuilder: (context, i) {
          if (i == 0) {
            return SizedBox(
              height: 50,
              child: Center(
                  child: itemList[i]
              ),
            );
          } else if (i < itemList.length) {
            return Container(
              color: AppTheme.colors.white,
              child: Center(
                  child: itemList[i]
              ),
            );
          }
          return Container();
        },
      separatorBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Divider(
              height: 0,
              color: AppTheme.colors.greyLight,
              thickness: 0.5,
            );
          } else if (index < itemList.length - 1) {
            return Divider(
              height: 0,
              color: AppTheme.colors.greyLight,
              thickness: 0.5,
              indent: 20,
            );
          } else if (index == itemList.length - 1) {
            return Divider(
              height: 0,
              color: AppTheme.colors.greyLight,
              thickness: 0.5,
            );
          } return const SizedBox();

    },);
  }

}