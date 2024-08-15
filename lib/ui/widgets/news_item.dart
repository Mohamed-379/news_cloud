import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_cloud/ui/news_details.dart';
import '../../services/news_services/articles_responses.dart';

class NewsItem extends StatelessWidget {
  Articles article;
  NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => NewsDetails(article: article),)),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage ?? '',
            imageBuilder: (context, imageProvider) => Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.fill),
              ),
            ),
            height: 200,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Container(
              alignment: Alignment.center,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.error,
                color: Colors.grey,
              ),
            ),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(color: Colors.orange,),
            ),
          ),
          Text(
            article.title ?? '',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            article.description ?? '',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          )
        ],
      ),
    );
  }
}