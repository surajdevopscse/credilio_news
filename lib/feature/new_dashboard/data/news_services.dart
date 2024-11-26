import 'dart:convert';

import 'package:news_demo/feature/new_dashboard/data/news_model.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  Future<NewsModel> getNews() async {
    var jsonResponse;
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=fc15d0dea137489b85b713ff51af68a5
    var url = Uri.https(
      'www.newsapi.org',
      '/v2/everything',
      {
        'q': 'bitcoin',
        'apiKey': 'fc15d0dea137489b85b713ff51af68a5',
      },
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalResults'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return NewsModel.fromJson(jsonResponse);
  }
}
