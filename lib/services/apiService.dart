import 'dart:convert';
import 'package:flutterdemo/models/webtoonModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonsInstances = [];
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonsInstances.add(WebtoonModel.fromJson(webtoon));
      }
      for (var element in webtoonsInstances) {
        print(element.title);
      }
      return webtoonsInstances;
    }
    throw Error();
  }
}
