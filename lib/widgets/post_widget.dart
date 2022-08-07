import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  PageTile({Key? key, required Map<String, dynamic> jsonMap})
      : super(key: key) {
    title = jsonMap['title'] ?? '';
    description = jsonMap['description'] ?? '';
    urlToImage = jsonMap['urlToImage'] ?? '';
    publishedAt = jsonMap['publishedAt'] ?? '';
    //DateFormat("yyyy/MM/dd").parse(jsonMap['publishedAt']).toString();
  }
  late final String title;
  late final String description;
  late final String urlToImage;
  late final String publishedAt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
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
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    publishedAt,
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
