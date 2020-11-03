import 'package:flutter/material.dart';
import 'package:smart_pos/core/enums/page_type.dart';
import 'package:smart_pos/ui/mainview/leftbar.dart';
import 'package:smart_pos/ui/utils/build_utils.dart';

class MainMenuTile extends StatelessWidget {
  final Function onTap;
  final PageType pageType;
  final bool selected;
  final IconData icon;
  final String title;
  const MainMenuTile({
    Key key,
    @required this.onTap,
    @required this.icon,
    @required this.title,
    @required this.pageType,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// If we have a pageType, send a notification to the parent menu, so it know the position of each btn, and can position it's current-page indicator
    if (pageType != null) {
      Future.delayed(Duration(milliseconds: 1000), () {
        Offset o = BuildUtils.getOffsetFromContext(context);
        MainMenuOffsetNotification(pageType, o).dispatch(context);
      });
    }
    return ListTile(
      leading: Icon(icon),
      selected: selected,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
