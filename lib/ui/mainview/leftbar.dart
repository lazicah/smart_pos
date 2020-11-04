import 'package:flutter/material.dart';
import 'package:smart_pos/core/enums/page_type.dart';
import 'package:smart_pos/core/provider/app/app_model.dart';
import 'package:smart_pos/ui/utils/styles.dart';
import 'package:smart_pos/ui/widgets/app_logo.dart';
import 'package:smart_pos/ui/widgets/main_menu_tile.dart';
import 'package:smart_pos/ui/widgets/scroll_view.dart';
import 'package:smart_pos/ui/widgets/styled_container.dart';
import 'package:provider/provider.dart';

class MainMenuOffsetNotification extends Notification {
  final Offset offset;
  final PageType pageType;

  MainMenuOffsetNotification(this.pageType, this.offset);
}

class LeftNavBar extends StatefulWidget {
  final Function(PageType type) onPageSelected;

  const LeftNavBar({Key key, this.onPageSelected}) : super(key: key);

  @override
  _LeftNavBarState createState() => _LeftNavBarState();
}

class _LeftNavBarState extends State<LeftNavBar> {
  Map<PageType, Offset> _menuBtnOffsetsByType = {};
  PageType _prevPage;

  double get _headerHeight => 80;

  double get _indicatorHeight => 40;

  double get _btnHeight => 40;

  double _indicatorY;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateIndicatorState(context.read<AppModel>().page);
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      if (mounted) _updateIndicatorState(context.read<AppModel>().page);
    });

    super.didChangeDependencies();
  }

  void _handlePageSelected(PageType pageType) =>
      widget.onPageSelected?.call(pageType);

  void _updateIndicatorState(PageType type) {
    if (_menuBtnOffsetsByType.containsKey(type)) {
      Offset o = _menuBtnOffsetsByType[type];
      setState(() => _indicatorY =
          o.dy - _headerHeight + _btnHeight * .5 - _indicatorHeight * .5);
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentPage = context.select<AppModel, PageType>((value) => value.page);
    if (currentPage != _prevPage) {
      _updateIndicatorState(currentPage);
    }
    _prevPage = currentPage;
    return Container(
      width: 250,
      child: Material(
        color: Colors.transparent,
        child: Drawer(
          child: Material(
            color: Color(0xffFFFFFF),
            child: Container(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: _headerHeight,
                        child: AppLogo(),
                      ),
                      NotificationListener<MainMenuOffsetNotification>(
                        // Listen for [MainMenuOffsetNotification], dispatched from each [MainMenuBtn] that is assigned a pageType.
                        // We use these to position the animated indicator in [_updateIndicatorState]
                        onNotification: (n) {
                          _menuBtnOffsetsByType[n.pageType] = n.offset;
                          return true; // Return true so the notification stops here
                        },
                        child: ListTileTheme(
                          selectedColor: Colors.white,
                          dense: true,
                          child: Stack(
                            children: [
                              /// Animated line that moves up and down to select the current page
                              _AnimatedMenuIndicator(_indicatorY ?? 50.0,
                                  height: _indicatorHeight),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 50.0,
                                  ),
                                  MainMenuTile(
                                    pageType: PageType.Dashboard,
                                    icon: Icons.dashboard,
                                    title: 'Dashboard',
                                    selected: currentPage == PageType.Dashboard,
                                    onTap: () =>
                                        _handlePageSelected(PageType.Dashboard),
                                  ),
                                  MainMenuTile(
                                    pageType: PageType.FoodDrinks,
                                    icon: Icons.emoji_food_beverage,
                                    title: 'Food & Drinks',
                                    selected:
                                        currentPage == PageType.FoodDrinks,
                                    onTap: () => _handlePageSelected(
                                        PageType.FoodDrinks),
                                  ),
                                  MainMenuTile(
                                    pageType: PageType.Messages,
                                    icon: Icons.chat_bubble,
                                    title: 'Messages',
                                    selected: currentPage == PageType.Messages,
                                    onTap: () =>
                                        _handlePageSelected(PageType.Messages),
                                  ),
                                  MainMenuTile(
                                    pageType: PageType.Bills,
                                    icon: Icons.money,
                                    title: 'Bills',
                                    selected: currentPage == PageType.Bills,
                                    onTap: () =>
                                        _handlePageSelected(PageType.Bills),
                                  ),
                                  MainMenuTile(
                                    pageType: PageType.Settings,
                                    icon: Icons.settings_applications,
                                    title: 'Settings',
                                    selected: currentPage == PageType.Settings,
                                    onTap: () =>
                                        _handlePageSelected(PageType.Settings),
                                  ),
                                  VSpace(10),
                                  ListTile(
                                    title: Text('Other'),
                                  ),
                                  MainMenuTile(
                                    pageType: PageType.Notifications,
                                    icon: Icons.notifications,
                                    title: 'Notifications',
                                    selected:
                                        currentPage == PageType.Notifications,
                                    onTap: () => _handlePageSelected(
                                        PageType.Notifications),
                                  ),
                                  MainMenuTile(
                                    pageType: PageType.Support,
                                    icon: Icons.support_agent,
                                    title: 'Support',
                                    selected: currentPage == PageType.Support,
                                    onTap: () =>
                                        _handlePageSelected(PageType.Support),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50.0),
                      child: LayoutBuilder(builder: (context, constraints) {
                        if (constraints.biggest.height < 149.0) {
                          return StyledContainer(
                            Colors.white,
                            height: 70,
                            margin: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 30),
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(15.0),
                            shadows: [
                              BoxShadow(
                                offset: Offset(0, 2.8),
                                blurRadius: 2.2,
                                color: Color.fromRGBO(0, 0, 0, 0.034),
                              ),
                              BoxShadow(
                                offset: Offset(0, 20),
                                blurRadius: 30,
                                color: Color.fromRGBO(0, 0, 0, 0.048),
                              ),
                            ],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(),
                                  HSpace(10),
                                  Column(
                                    children: [
                                      Text(
                                        'Theresa Web',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      VSpace(5),
                                      Text(
                                        'Waiter 4h 5min',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        return Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            StyledContainer(
                              Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Theresa Web',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  VSpace(5),
                                  Text(
                                    'Waiter 4h 5min',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: FlatButton(
                                        color: Colors.grey.shade200,
                                        onPressed: () {},
                                        child: Text(
                                          'Open Profile',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              margin: const EdgeInsets.only(
                                  left: 30, right: 30, bottom: 30),
                              height: 150,
                              width: double.infinity,
                              shadows: [
                                BoxShadow(
                                  offset: Offset(0, 2.8),
                                  blurRadius: 2.2,
                                  color: Color.fromRGBO(0, 0, 0, 0.034),
                                ),
                                BoxShadow(
                                  offset: Offset(0, 20),
                                  blurRadius: 30,
                                  color: Color.fromRGBO(0, 0, 0, 0.048),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            Positioned(top: -20, child: CircleAvatar())
                          ],
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      '@ 2020 SmartPOS App',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedMenuIndicator extends StatefulWidget {
  final double indicatorY;
  final double width;
  final double height;

  _AnimatedMenuIndicator(this.indicatorY,
      {this.width = double.infinity, this.height = 24});

  @override
  _AnimatedMenuIndicatorState createState() => _AnimatedMenuIndicatorState();
}

class _AnimatedMenuIndicatorState extends State<_AnimatedMenuIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutBack,
        width: widget.width,
        height: widget.height,
        child: StyledContainer(
          Color(0xffFFCA40),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(
            top: widget.indicatorY ?? 20.0, left: 10, right: 10));
  }
}
