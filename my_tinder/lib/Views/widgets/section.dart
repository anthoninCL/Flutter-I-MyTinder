import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_theme.dart';

class Section extends StatelessWidget {
  final List<Widget> itemList;

  const Section({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
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
              height: 50,
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

/*

return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });

void main() {
  List<SectionItem> items = [SimpleSectionItem('Lifestyle'), SliderSectionItem('Age')];


}



class SliderSectionItem implements SectionItem {
  final String title;

  SliderSectionItem(this.title);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
        title
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: buildTitle(context),
        ),
        Slider(value: value, onChanged: onChanged),
        const Divider()
      ],
    )
  }
}

 */