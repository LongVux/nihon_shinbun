import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:nihon_shinbun/models/data/article_tile.dart';

class ArticleTileWidget extends StatefulWidget {
  const ArticleTileWidget({super.key, required this.articleTile});

  final ArticleTile articleTile;

  @override
  State<ArticleTileWidget> createState() => _ArticleTileWidgetState();
}

class _ArticleTileWidgetState extends State<ArticleTileWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Image(
            image: NetworkImage(widget.articleTile.getArticleImage),
            width: 100,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  widget.articleTile.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  DateFormat.yMMMd()
                      .add_Hm()
                      .format(widget.articleTile.creationDate),
                  style: const TextStyle(
                      color: Color.fromARGB(185, 97, 97, 97), fontSize: 12),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
