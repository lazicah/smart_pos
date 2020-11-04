import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos/core/models/recipe_data.dart';
import 'package:smart_pos/ui/contentscreens/food_drinks/food_drinks_vm.dart';
import 'package:smart_pos/ui/utils/build_utils.dart';
import 'package:smart_pos/ui/utils/styles.dart';
import 'package:smart_pos/ui/widgets/animated_panel.dart';
import 'package:smart_pos/ui/widgets/app_logo.dart';
import 'package:smart_pos/ui/widgets/constrained_flexview.dart';
import 'package:smart_pos/ui/widgets/mouse_hover.dart';
import 'package:smart_pos/ui/widgets/scroll_bar.dart';
import 'package:smart_pos/ui/widgets/scroll_view.dart';
import 'package:smart_pos/ui/widgets/styled_container.dart';
import 'package:stacked/stacked.dart';

class FoodAndDrinksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FoodDrinksVm>.reactive(
      viewModelBuilder: () => FoodDrinksVm(),
      onModelReady: (model) async => await model.loadData(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  FoodHeader(),
                  Expanded(child: FoodBody()),
                ],
              ),
            ),
            model.selected != null
                ? RightPanel(
                    data: model.selected,
                    model: model,
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class RightPanel extends StatelessWidget {
  final RecipeData data;
  final FoodDrinksVm model;
  const RightPanel({Key key, this.data, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: StyledContainer(
        Colors.white,
        width: 400,
        height: double.infinity,
        child: StyledScrollView(
          axis: Axis.vertical,
          trackColor: Color(0xffFFfA40).withOpacity(0.05),
          handleColor: Color(0xffFFCA40).withAlpha(255),
          child: Stack(
            children: [
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return FadeScaleTransition(
                    animation: animation,
                    child: child,
                  );
                },
                child: Column(
                  key: UniqueKey(),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      color: Color(0xffFFCA40).withOpacity(0.5),
                      child: Image.network(
                        data?.thumbnailUrl ??
                            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          VSpace(5),
                          Text(
                            data.description ?? '',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                child: IconButton(
                  icon: Icon(Icons.close_rounded, color: Colors.white),
                  onPressed: () => model.showRightPanel = false,
                ),
              )
            ],
          ),
        ),
      ),
    ).animatedPanelX(
      closeX: 400,
      isClosed: !model.showRightPanel,
    );
  }
}

class FoodHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20.0),
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
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodDrinksVm>(
      builder: (context, model, _) {
        if (model.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => await model.loadData(),
          child: StyledScrollView(
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
                  GridView.builder(
                    padding: const EdgeInsets.only(bottom: 30),
                    shrinkWrap: true,
                    itemCount: model.recipes.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 200 / 300,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      RecipeData data = model.recipes[index];
                      return RecipeCard(
                        data: data,
                        model: model,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class RecipeCard extends StatelessWidget {
  final RecipeData data;
  final FoodDrinksVm model;
  const RecipeCard({
    Key key,
    this.data,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseHoverBuilder(
      isClickable: true,
      builder: (context, hovering) => GestureDetector(
        onTap: () => model.selected = data,
        child: StyledContainer(
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
          border:
              hovering ? Border.all(color: Color(0xffFFCA40), width: 2) : null,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xffFFCA40).withOpacity(0.5),
                    child: Image.network(
                      data.thumbnailUrl ??
                          'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      fit: BoxFit.fill,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.name,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        VSpace(5),
                        Flexible(
                          child: Text(
                            data.description ?? '',
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
