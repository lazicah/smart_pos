import 'package:flutter/material.dart';
import 'package:smart_pos/core/enums/page_type.dart';
import 'package:smart_pos/ui/contentscreens/index.dart';

Widget getPageByType(PageType type) {
  Widget page;
  switch (type) {
    case PageType.Dashboard:
      page = DashboardView();
      break;
    case PageType.FoodDrinks:
      page = FoodAndDrinksView();
      break;
    case PageType.Messages:
      page = MessagesView();
      break;
    case PageType.Bills:
      page = BillsView();
      break;
    case PageType.Settings:
      page = SettingsView();
      break;
    case PageType.Notifications:
      page = NotificationsView();
      break;
    case PageType.Support:
      page = SupportView();
      break;
    default:
      page = Center(
        child: Text('Not found'),
      );
  }
  return page;
}
