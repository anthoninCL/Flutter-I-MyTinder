import 'package:flutter/material.dart';
import 'package:my_tinder/shared/widgets/button.dart';
import 'package:my_tinder/shared/widgets/search_bar.dart';
import 'package:my_tinder/themes/app_theme.dart';

import 'floatting_text_button.dart';

bottomModal(context, title, list, setState, value) {
  return (showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                height: MediaQuery.of(context).orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height * 0.6
                    : MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        height: 6,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppTheme.colors.greyLight,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 10),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppTheme.colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            fontSize: 25),
                      ),
                    ),
                    Expanded(
                      child: Wrap(
                        spacing: 7.0,
                        runSpacing: 5.0,
                        direction: Axis.horizontal,
                        // main axis (rows or columns)
                        children: [
                          for (var item in list)
                            TilesButton(
                              title: item.title,
                              setValue: (_value) => state(() {
                                value = _value;
                                setState(_value);
                              }),
                              iconData: item.iconData,
                              value: value,
                            )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: FloattingTextButton(
                          title: 'Finish',
                          setState: setState!,
                        ),
                      ),
                    )
                  ],
                ),
              ));
        }
      )));
}

bottomSearchModal(context, title, list, setState, values) {
  List<TilesButton> _newList = list;
  final TextEditingController _textController = TextEditingController();

  onItemChanged(String value) {
    setState(() {
      _newList = list
          .where((item) => item.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  onClear() {
    setState(() {
      _newList = list;
    });
    _textController.clear();
  }

  return (showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SizedBox(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.6
                : MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: 6,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppTheme.colors.greyLight,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 10),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppTheme.colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 25),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SearchBar(
                      onValueChanged: onItemChanged,
                      textController: _textController,
                      hintText: "Search someone...",
                      onClear: onClear,
                    )
                ),
                Expanded(
                  child: Wrap(
                    spacing: 7.0,
                    runSpacing: 5.0,
                    direction: Axis.horizontal,
                    // main axis (rows or columns)
                    children: [
                      for (var item in _newList)
                        TilesButton(
                          title: item.title,
                          setValue: setState,
                          iconData: item.iconData,
                          value: values,
                        )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: FloattingTextButton(
                      title: 'Finish',
                      setState: setState!,
                    ),
                  ),
                )
              ],
            ),
          ))));
}
