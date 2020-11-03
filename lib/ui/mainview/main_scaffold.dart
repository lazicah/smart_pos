import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos/core/provider/app/app_model.dart';
import 'package:smart_pos/ui/mainview/content.dart';
import 'package:smart_pos/ui/mainview/leftbar.dart';

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, _) {
        return Scaffold(
          body: Container(
            child: Row(
              children: [
                LeftNavBar(
                  onPageSelected: (pageType) {
                    model.page = pageType;
                  },
                ),
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
          ),
        );
      },
    );
  }
}
