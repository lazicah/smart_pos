import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:smart_pos/core/locator.dart';
import 'package:smart_pos/core/models/recipe_data.dart';
import 'package:smart_pos/core/repository/repository.dart';

class FoodDrinksVm extends ChangeNotifier {
  final repo = locator<RecipeRepository>();

  List<RecipeData> _data = [];
  List<RecipeData> get recipes => _data;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  RecipeData _selected;
  RecipeData get selected => _selected;

  set selected(RecipeData data) {
    _selected = data;
    _showRightPanel = true;
    notifyListeners();
  }

  bool _showRightPanel = false;
  bool get showRightPanel => _showRightPanel;

  set showRightPanel(bool value) {
    _showRightPanel = value;
    notifyListeners();
  }

  Future<void> loadData() async {
    isLoading = true;
    try {
      var resource = await repo.getRecipes();
      _data = List.from(resource);
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print(e.toString());
    }

    notifyListeners();
  }
}
