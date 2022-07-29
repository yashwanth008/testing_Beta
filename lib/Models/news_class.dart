class Article{
  String title;
  String imageUrl;
  String url;

  Article({required this.title,required this.imageUrl,required this.url});

  factory Article.fromJson(Map<String,dynamic>json){
    return Article(
        title: json['title'] as String,
        imageUrl: json['urlToImage'] as String,
        url: json['url'] as String,
    );
  }

}

