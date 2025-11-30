import 'package:flutter/widgets.dart';

class AppSizes {
  static double ratio(BuildContext context) {
    return MediaQuery.of(context).size.width / 428;
  }
}
