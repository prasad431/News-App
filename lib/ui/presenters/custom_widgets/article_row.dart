import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:news_app/data/entities/article.dart';
import 'package:news_app/ui/core/utilities/constants/strings.dart';

class ArticleRow extends StatelessWidget {
  final Article article;

  const ArticleRow({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formattedTime =
        DateFormat('dd MMM - HH:mm').format(article.publishedAt);
    return GestureDetector(
      child: Container(
        height: 100,
        margin: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            /*Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                  )),
            ),*/
            SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(formattedTime),
                  Text(
                    article.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    article.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, Strings.kwebPage, arguments: article);
      },
    );
  }
}
