class NewsEntityModel {
  String id;
  String newsHeadline;
  String newsDescription;
  String imageUrl;
  String source;

  NewsEntityModel({
    required this.id,
    required this.newsDescription,
    required this.newsHeadline,
    required this.imageUrl,
    required this.source,
  });
}
