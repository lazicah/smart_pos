import 'dart:convert';
import 'package:http/http.dart' as http;

dynamic responseHandler(http.Response response) async {
  switch (response.statusCode) {
    case 201:
    case 200:
      //print(['200/201 >>', response.body]);
      return response.body;
      break;
    case 400:
      print(['400 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);

      throw (error.error);

      break;
    case 401:
      print(['401 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);
      throw (error.error);
      break;
    case 403:
      print(['403 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);
      throw (error.error);
      break;
    case 404:
      print(['404 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);
      throw (error.error);
      break;
    case 409:
      print(['409 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);
      throw (error.error);
      break;
    case 500:
    default:
      print(['500 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);
      throw ("Can't process this request at the moment, please try again");
      break;
  }
}

ApiErrorModel apiErrorModelFromJson(String str) =>
    ApiErrorModel.fromJson(json.decode(str));

String apiErrorModelToJson(ApiErrorModel data) => json.encode(data.toJson());

class ApiErrorModel {
  dynamic error;

  ApiErrorModel({
    this.error,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        error: json["error"] ?? json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
      };
}
