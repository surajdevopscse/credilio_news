import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_demo/feature/new_dashboard/data/news_model.dart';
import 'package:news_demo/feature/new_dashboard/data/news_services.dart';
import 'package:news_demo/feature/new_dashboard/domain/news_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDashBoarrdController extends GetxController {
  NewsRepository newsRepository = NewsRepository(
    newsServices: NewsServices(),
  );

  NewsModel? responseModel;

  @override
  void onInit() {
    dataInitialize();
    super.onInit();
  }

  void dataInitialize() async {
    final resultData = await newsRepository.getNews();
    responseModel = resultData;
    update();
  }

  Future<void> launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
