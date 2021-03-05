
import 'package:flutter/foundation.dart';


abstract class HasLayoutGroup {
  VoidCallback get onLayoutToggle;
}

enum LayoutPage {
  newasset,
  login,
  load_haul,
  datacollection,
}

String layoutName(LayoutPage layoutPage) {
  switch (layoutPage) {
    case LayoutPage.newasset:
      return 'New';
    case LayoutPage.login:
      return 'Login';
    case LayoutPage.load_haul:
      return 'Production';
    case LayoutPage.datacollection:
      return 'Data Collection';
    default:
      return '';
  }
}
