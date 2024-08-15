import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_cloud/ui/utils/error_dialog.dart';
import 'package:new_cloud/ui/utils/loading_dialog.dart';
import 'package:new_cloud/ui/widgets/news_list_view.dart';
import '../services/news_services/articles_responses.dart';
import '../services/news_services/news_services.dart';

class CategoryNewsListView extends StatefulWidget {
  String categoryId;
  CategoryNewsListView({super.key, required this.categoryId});

  @override
  State<CategoryNewsListView> createState() => _CategoryNewsListViewState();
}

class _CategoryNewsListViewState extends State<CategoryNewsListView> {
  var future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsServices(dio: Dio()).getNews(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          FutureBuilder<List<Articles>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SliverPadding(
                    padding: const EdgeInsets.only(top: 30),
                    sliver: NewsListView(articles: snapshot.data!));
              } else if (snapshot.hasError) {
                return ErrorDialog(message: snapshot.error.toString());
              } else {
                return const LoadingDialog();
              }
            },
          )
        ],
      ),
    );
  }
}