import 'package:flutter/material.dart';
import 'package:new_cloud/ui/widgets/news_item.dart';
import '../../services/news_services/articles_responses.dart';

class CategoryNewsItem extends StatelessWidget {
  List<Articles> articles;
  CategoryNewsItem({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: NewsItem(
          article: articles[index],
        ),
      ),
    );
  }
}