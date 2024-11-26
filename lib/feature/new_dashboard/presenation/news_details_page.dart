import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_demo/feature/new_dashboard/data/news_model.dart';
import 'package:news_demo/feature/new_dashboard/presenation/news_dash_boarrd_controller.dart';

class NewsDeatilsPage extends GetView<NewsDashBoarrdController> {
  final Article newsModel;
  const NewsDeatilsPage({required this.newsModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsModel.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(newsModel.urlToImage ?? ''),
                ),
                color: Colors.blue[200],
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${newsModel.publishedAt.day.toString()} / ${newsModel.publishedAt.month.toString()} / ${newsModel.publishedAt.year.toString()}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  newsModel.author?.toString() ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              newsModel.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              newsModel.description ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              newsModel.content,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  controller.launchInBrowser(newsModel.url);
                },
                child: const Text('Read Full Article'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
