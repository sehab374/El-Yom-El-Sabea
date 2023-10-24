import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../../models/NewsDataModel.dart';
import '../../../models/sourceModel.dart';
import '../../constants/constants.dart';

class ApiManager {
  static Future<SourceResponse> getsourses() async {
    Uri url = Uri.https(base, "/v2/top-headlines/sources", {"apikey": apiKey});
    http.Response response = await http.get(url);
    var jsonData = json.decode(response.body);

    SourceResponse sourceResponse = SourceResponse.fromJson(jsonData);
    return sourceResponse;
  }

  static Future<NewsDataModel> getNewsData(String sourceId) async {
    Uri url = Uri.https(
        base, "v2/everything", {"apikey": apiKey, "sources": sourceId});
    Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(jsonData);
    return newsDataModel;
  }
}
