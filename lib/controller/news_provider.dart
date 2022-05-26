import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/model/news_model.dart';

class NewsProvider with ChangeNotifier {
  List<Article> _newsArticle = [];
  List<Article> get newsArticle {
    return [..._newsArticle];
  }

  Future get getData async {
    // URL API
    const url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=7d436d60bd614012a24c3484d2e8a68a";

    // My Response
    final response = await http.get(Uri.parse(url));

    // List of Articles
    final extractedDataArticles =
        json.decode(response.body)["articles"] as List<dynamic>;

    try {
      if (response.statusCode == 200) {
        // True
        for (Map<String, dynamic> map in extractedDataArticles) {
          _newsArticle.add(Article.fromJson({
            "source": {
              "id": map["source"]["id"],
              "name": map["source"]["name"]
            },
            "author": map["author"],
            "title": map["title"],
            "description": map["description"],
            "url": map["url"],
            "urlToImage": map["urlToImage"],
          }));
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
