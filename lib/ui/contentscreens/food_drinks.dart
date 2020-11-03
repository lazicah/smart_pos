import 'package:flutter/material.dart';
import 'package:smart_pos/ui/utils/build_utils.dart';
import 'package:smart_pos/ui/utils/styles.dart';
import 'package:smart_pos/ui/widgets/app_logo.dart';
import 'package:smart_pos/ui/widgets/constrained_flexview.dart';
import 'package:smart_pos/ui/widgets/mouse_hover.dart';
import 'package:smart_pos/ui/widgets/scroll_bar.dart';
import 'package:smart_pos/ui/widgets/scroll_view.dart';
import 'package:smart_pos/ui/widgets/styled_container.dart';

class FoodAndDrinksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        children: [
          FoodHeader(),
          Expanded(child: FoodBody()),
        ],
      ),
    );
  }
}

class FoodHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40.0),
      child: Row(
        children: [
          Spacer(),
          ClipRRect(
            child: Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  fillColor: Color(0xffF8F8F7),
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          // Align(
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: [
          //         ColoredContainerBG(
          //           child: Icon(Icons.arrow_back_ios),
          //         )
          //       ],
          //     )),
        ],
      ),
    );
  }
}

class FoodBody extends StatefulWidget {
  @override
  _FoodBodyState createState() => _FoodBodyState();
}

class _FoodBodyState extends State<FoodBody> {
  ScrollController scrollController;
  double size = 0;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(FoodBody oldWidget) {
    if (oldWidget != widget) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return StyledScrollView(
      trackColor: Color(0xffFFfA40).withOpacity(0.05),
      handleColor: Color(0xffFFCA40).withAlpha(255),
      axis: Axis.vertical,
      scrollBarPadding: const EdgeInsets.only(right: 10, bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foods & Drinks',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.w700),
            ),
            VSpace(20),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 350 / 500,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              children: [
                ...List.generate(
                  20,
                  (index) {
                    return MouseHoverBuilder(
                      isClickable: true,
                      builder: (context, hovering) => StyledContainer(
                        Colors.white,
                        shadows: [
                          BoxShadow(
                            offset: Offset(0, 2.8),
                            blurRadius: 2.2,
                            color: Color.fromRGBO(0, 0, 0, 0.034),
                          ),
                          BoxShadow(
                            offset: Offset(0, 6.7),
                            blurRadius: 5.3,
                            color: Color.fromRGBO(0, 0, 0, 0.048),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                        border: hovering
                            ? Border.all(color: Color(0xffFFCA40), width: 2)
                            : null,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                    color: Color(0xffFFCA40).withOpacity(0.5)),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Food $index',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
