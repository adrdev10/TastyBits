import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
  


//Helper class to help with communication with APIs
class ApiBaseHelper {
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<dynamic> get(String url) async {
    var client = http.Client();
    var responseJson;
    try {
      final response = await client.get(url);
      responseJson = convertResponseToJson(response);
    }finally {
      client.close();
    }
  }

  dynamic convertResponseToJson(http.Response response) {
    switch (response.statusCode){
      case 200:
        final responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw HttpStatus.badRequest;
      case 500:
      default:
        throw new Exception('Error occured while communicating with the server');
    }
  }
}