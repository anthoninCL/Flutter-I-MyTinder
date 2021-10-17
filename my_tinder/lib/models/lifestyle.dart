import 'package:flutter/cupertino.dart';
import 'package:my_tinder/shared/widgets/button.dart';

class Lifestyle {
  final Icon icon;
  final String title;
  String value;
  final String modalTitle;
  final List<TilesButton> list;
  final Function setState;

  Lifestyle(this.icon, this.title, this.value, this.modalTitle, this.list, this.setState);
}