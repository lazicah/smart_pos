abstract class RecipeDatasource {
  Future<dynamic> getRecipes();

  Future<dynamic> getRecipeDetails(String id);
}
