import 'package:flutter/material.dart';

class PageNews extends StatelessWidget {
  const PageNews(
      {Key? key,
      required this.title,
      required this.urlToImage,
      required this.content})
      : super(key: key);
  final String title;
  final String urlToImage;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(
                urlToImage,
                height: 400,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              content,
            ),
          ],
        ),
      ),
    );
  }
}
