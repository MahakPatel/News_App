
import 'package:http/http.dart' as http;
import 'package:news_app1/models/article.dart';

import 'dart:convert';



class News {

  List<Article> news  = [];

  Future<void> getNews() async{

    String url =  "https://newsapi.org/v2/top-headlines?country=in&apiKey=818c95688c2341dbab27b6f8b7beb7e4";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}


class NewsForCategorie {

  List<Article> news  = [];

  Future<void> getNewsForCategory(String category) async{

    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
   // String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=818c95688c2341dbab27b6f8b7beb7e";
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=818c95688c2341dbab27b6f8b7beb7e4";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}
