import 'dart:convert';

import 'package:exam_one/Model/Api_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  // Future <List<ApiModel>?> getDate() async {
  //   http.Response response = await http.get(Uri.parse("uri"));
  //
  //   if (response.statusCode == 200) {
  //     List <Map> decodedData = jsonDecode(response.body);
  //     List<ApiModel> apimodel = decodedData.map((e) => ApiModel.fromMap(data: e)).toList();
  //     return apimodel;
  //     // Map decodedData = jsonDecode(response.body);
  //     // List allData = decodedData['products'];
  //
  //   }
  //   return null;
  // }
  getData() async {
    String? Hostname;
    String? Apikey;
    String? Search;
    http.Response response = await http.get(Uri.parse("uri"));
    if (response.statusCode == 200) {
      Map decoded = jsonDecode(response.body);
      List<Map> aa = decoded[''];
      List<ApiModel> all = [];

      aa.forEach((e) {
        all.add(ApiModel.fromMap(data: e));
      });
    }
  }
}
