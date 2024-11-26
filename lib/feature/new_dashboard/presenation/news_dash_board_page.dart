import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_demo/core/common_widget/news_listing_card.dart';
import 'package:news_demo/feature/new_dashboard/presenation/news_dash_boarrd_controller.dart';
import 'package:news_demo/feature/new_dashboard/presenation/news_details_page.dart';

class NewsDashBoardPage extends StatelessWidget {
  const NewsDashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsDashBoarrdController controller = Get.put(NewsDashBoarrdController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: GetBuilder<NewsDashBoarrdController>(builder: (context) {
        return Container(
          padding: const EdgeInsets.all(12.0),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: controller.responseModel?.articles.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              if (controller.responseModel != null) {
                return InkWell(
                  onTap: () {
                    Get.to(
                      NewsDeatilsPage(
                        newsModel: controller.responseModel!.articles[index],
                      ),
                    );
                    print('Navigate to deatils');
                  },
                  child: NewsListingCard(
                    newsModel: controller.responseModel!.articles[index],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
