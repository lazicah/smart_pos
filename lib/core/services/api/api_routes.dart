class ApiRoutes {
  static const String baseUrl = 'https://rapidapi.p.rapidapi.com';
  static const String recipe_list = baseUrl + '/recipes/list';
  static const String recipe_detail = baseUrl + '/recipes/detail';
  static const String feed_list = baseUrl + '/feeds/list';

  static const Map<String, String> headers = {
    "x-rapidapi-key": "7921cf2737msh30fff12b087bc83p11c570jsn51194425dbef",
    "x-rapidapi-host": "tasty.p.rapidapi.com",
  };
}
