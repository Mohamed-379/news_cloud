import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_cloud/services/news_services/articles_responses.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  Articles article;
  NewsDetails({super.key, required this.article});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(widget.article.url??'');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => PhotoView(
                      imageProvider: NetworkImage(widget.article.urlToImage ?? ''),
                    ),
                  )),
              child: CachedNetworkImage(
                imageUrl: widget.article.urlToImage ?? '',
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
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              widget.article.title ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              widget.article.content ?? '',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () async{
                      await _launchUrl(url);
                    },
                    child: const Text(
                      'View Full Article',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.orange),
                    )))
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }
}