import 'package:flutter/material.dart';
import 'package:new_cloud/ui/widgets/news_item.dart';
import '../../services/news_services/articles_responses.dart';

class NewsListView extends StatelessWidget {
  List<Articles> articles;
  NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: articles.length,
      (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: NewsItem(
            article: articles[index],
          ),
        );
      },
    ));
  }
}