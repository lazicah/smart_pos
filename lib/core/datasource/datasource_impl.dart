import 'package:smart_pos/core/datasource/datasource.dart';
import 'package:smart_pos/core/locator.dart';
import 'package:smart_pos/core/services/api/api_routes.dart';
import 'package:smart_pos/core/services/api/apiservice.dart';

class RecipeDataSourceImpl implements RecipeDatasource {
  final apiservice = locator<ApiService>();
  @override
  Future<dynamic> getRecipeDetails(String id) async {
    var response;

    try {
      response = await apiservice.get(
          '${ApiRoutes.recipe_detail}?id=$id', ApiRoutes.headers);
      print(response);
    } catch (e) {
      rethrow;
    }
    return response;
  }

  @override
  Future<dynamic> getRecipes() async {
    var response;
    print('called data source');
    try {
      response = await apiservice.get(
          '${ApiRoutes.recipe_list}?from=0&size=50&tags=under_30_minutes',
          ApiRoutes.headers);
      //print('data source $response');
    } catch (e) {
      rethrow;
    }

    return response;
  }
}
