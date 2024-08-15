import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_cloud/services/news_services/articles_responses.dart';
import 'package:new_cloud/services/news_services/news_services.dart';
import 'package:new_cloud/ui/utils/error_dialog.dart';
import 'package:new_cloud/ui/utils/loading_dialog.dart';
import 'package:new_cloud/ui/widgets/news_list_view.dart';

class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder({super.key});

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {

  var future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsServices(dio: Dio()).getNews('general');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Articles>>(
        future: future,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return NewsListView(articles: snapshot.data!);
          }else if(snapshot.hasError){
            return ErrorDialog(message: snapshot.error.toString());
          }else{
            return const LoadingDialog();
          }
        },
    );
  }
}