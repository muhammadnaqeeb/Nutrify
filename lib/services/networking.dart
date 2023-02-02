import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String url =
      "https://api.edamam.com/api/nutrition-data?app_id=6c22e71e&app_key=7276eb26539efd6d2fb203ffb69299f7&nutrition-type=cooking&ingr=";
  String query;

  NetworkHelper(this.query);
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url + query));
    //print(response.body);
    print("asdfghjkl_______________________${response.statusCode}");

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      //print(decodedData);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
