import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos/core/provider/app/app_model.dart';
import 'package:smart_pos/ui/mainview/content.dart';
import 'package:smart_pos/ui/mainview/leftbar.dart';
import 'package:smart_pos/ui/utils/screen_utils.dart';
import 'package:smart_pos/ui/widgets/app_logo.dart';
import 'package:smart_pos/ui/widgets/responsive_container.dart';
import 'package:smart_pos/ui/widgets/animated_panel.dart';

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    bool isNarrowDesktop =
        MediaQuery.of(context).size.width < PageBreaks.Desktop;
    final model = context.watch<AppModel>();
    return Scaffold(
      key: scaffoldKey,
      drawer: isNarrowDesktop
          ? LeftNavBar(
              onPageSelected: (pageType) {
                Navigator.pop(context);
                model.page = pageType;
              },
            )
          : null,
      body: Container(
        child: Stack(
          children: [
            Row(
              children: [
                LeftNavBar(
                  onPageSelected: (pageType) {
                    model.page = pageType;
                  },
                ).animatedPanelX(closeX: -250, isClosed: isNarrowDesktop),
                Container(
                  height: double.infinity,
                  width: 1,
                  color: Color(0xffF3F3F3),
                ),
                Expanded(
                  child: MainContent(pageType: model.page),
                )
              ],
            ),
            isNarrowDesktop
                ? Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        scaffoldKey.currentState.openDrawer();
                      },
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
