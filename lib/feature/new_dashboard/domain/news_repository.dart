import 'package:news_demo/feature/new_dashboard/data/news_model.dart';
import 'package:news_demo/feature/new_dashboard/data/news_services.dart';
import 'package:news_demo/feature/new_dashboard/domain/news_use_cases.dart';

class NewsRepository extends NewsUseCases {
  final NewsServices newsServices;
  NewsRepository({required this.newsServices});
  @override
  Future<NewsModel> getNews() async {
    return await newsServices.getNews();
  }
}
