import 'package:news_demo/feature/new_dashboard/data/news_model.dart';

abstract class NewsUseCases {
  Future<NewsModel> getNews();
}
