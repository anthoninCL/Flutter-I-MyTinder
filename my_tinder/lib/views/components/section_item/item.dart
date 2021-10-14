import 'package:flutter/cupertino.dart';

abstract class SectionItem {
  Widget buildTitle(BuildContext context);
  Widget buildWidget(BuildContext context);
}
