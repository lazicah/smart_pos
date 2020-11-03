import 'package:flutter/material.dart';
import 'package:smart_pos/ui/contentscreens/food_drinks/category.dart';
import 'package:smart_pos/ui/contentscreens/food_drinks/food_drinks.dart';
import 'package:smart_pos/ui/utils/page_routes.dart';

class FoodDrinksBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/food&Drinks',
      onGenerateRoute: (settings) {
        print('called ${settings.name}');
        switch (settings.name) {
          case '/food&Drinks':
            return PageRoutes.fade(() => FoodAndDrinksView());
          case '/food&Drinks/Category':
            return PageRoutes.fade(() => FoodCategoryScreen());
        }
      },
    );
  }
}
