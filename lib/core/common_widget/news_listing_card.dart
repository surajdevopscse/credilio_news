import 'package:flutter/material.dart';
import 'package:news_demo/feature/new_dashboard/data/news_model.dart';

class NewsListingCard extends StatelessWidget {
  final Article newsModel;
  const NewsListingCard({required this.newsModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${newsModel.publishedAt.day.toString()} / ${newsModel.publishedAt.month.toString()} / ${newsModel.publishedAt.year.toString()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                newsModel.author?.toString() ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const Spacer(),
          Text(
            newsModel.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            newsModel.description ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
