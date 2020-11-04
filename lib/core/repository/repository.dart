import 'dart:convert';

import 'package:smart_pos/core/datasource/datasource.dart';
import 'package:smart_pos/core/models/recipe_data.dart';

import '../locator.dart';

abstract class RecipeRepository {
  Future<List<RecipeData>> getRecipes();

  Future<RecipeData> getRecipeDetails();
}

class Repository implements RecipeRepository {
  final dataSrc = locator<RecipeDatasource>();
  @override
  Future<RecipeData> getRecipeDetails() async {
    RecipeData data;
    try {
      var result = await dataSrc.getRecipes();
      print('result $result');
      data = RecipeData.fromJson(result);
    } catch (e) {
      rethrow;
    }
    return data;
  }

  @override
  Future<List<RecipeData>> getRecipes() async {
    List<RecipeData> data;
    try {
      var result = await dataSrc.getRecipes();
      var decodedJson = jsonDecode(result) as Map<String, dynamic>;
      var list = decodedJson['results'] as List;
      //print('result ${list.first}');
      data = list.map<RecipeData>((e) {
        var data = e as Map<String, dynamic>;
        var tags = data['tags'] as List;
        RecipeData recipeData = RecipeData();
        return recipeData.copyWith(
            name: data['name'],
            thumbnailUrl: data['thumbnail_url'],
            description: data['description']);
      }).toList();
    } catch (e) {
      rethrow;
    }
    return data;
  }
}
