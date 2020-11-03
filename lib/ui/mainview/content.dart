import 'package:flutter/material.dart';
import 'package:smart_pos/core/enums/page_type.dart';
import 'package:smart_pos/core/provider/app/app_model.dart';
import 'package:smart_pos/core/utils/utils.dart';
import 'package:smart_pos/ui/contentscreens/food_drinks/food_drinks_router.dart';
import 'package:smart_pos/ui/contentscreens/index.dart';
import 'package:smart_pos/ui/widgets/fading_indexstack.dart';
import 'package:provider/provider.dart';

class MainContent extends StatelessWidget {
  final PageType pageType;

  const MainContent({Key key, @required this.pageType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var pages =
        context.select<AppModel, List<PageType>>((value) => value.pages);
    return Container(
        height: MediaQuery.of(context).size.height,
        child: FadingIndexedStack(
          index: pages.indexOf(pageType),
          children: [
            DashboardView(),
            FoodDrinksBase(),
            MessagesView(),
            BillsView(),
            SettingsView(),
            NotificationsView(),
            SupportView(),
          ],
        ));
  }
}
