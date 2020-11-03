import 'package:flutter/cupertino.dart';
import 'package:smart_pos/core/enums/page_type.dart';

class AppModel extends ChangeNotifier {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  PageType _pageType = PageType.Dashboard;
  PageType get page => _pageType;

  set page(PageType pageType) {
    _pageType = pageType;
    notifyListeners();
  }

  List<PageType> get pages => [
        PageType.Dashboard,
        PageType.FoodDrinks,
        PageType.Messages,
        PageType.Bills,
        PageType.Settings,
        PageType.Notifications,
        PageType.Support
      ];
}
