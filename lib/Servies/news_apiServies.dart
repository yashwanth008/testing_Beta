import 'package:http/http.dart' as http;
import 'package:test_alpha/Models/news_class.dart';
import 'dart:convert';


class NewsApiServies {
  final Url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=12dfe48c039b4cfcb60403babb2c6763";

  Future <List<Article>?> getArticles() async {
    http.Response res = await http.get(Uri.parse(Url));
    if(res.statusCode == 200){
        Map<String,dynamic> json = jsonDecode(res.body);
        List<dynamic> body = json['articles'];

        List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();

        return articles;
    }else{
      throw (" Can't get the Articles");
    }
  }
}