import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:nihon_shinbun/constants/route.dart';
import 'package:nihon_shinbun/models/data/article_tile.dart';
import 'package:nihon_shinbun/models/view/route_argument.dart';
import 'package:nihon_shinbun/providers/main_page_provider.dart';
import 'package:nihon_shinbun/views/image_hero.dart';
import 'package:provider/provider.dart';

class ArticleTileWidget extends StatefulWidget {
  const ArticleTileWidget({super.key, required this.articleTile});

  final ArticleTile articleTile;

  @override
  State<ArticleTileWidget> createState() => _ArticleTileWidgetState();
}

class _ArticleTileWidgetState extends State<ArticleTileWidget> {
  @override
  Widget build(BuildContext context) {
    final mainPageContext = Provider.of<MainPageContextProvider>(context);

    return GestureDetector(
      onTap: (() {
        Navigator.of(context).pushNamed(MainPageNestedRoute.article.toString(),
            arguments: ArticleRouteArgument(widget.articleTile.id));
        mainPageContext.changeRoute(MainPageNestedRoute.article);
      }),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            ImageHeroWidget(
                imageUrl: widget.articleTile.getArticleImage,
                width: 100,
                tag: widget.articleTile.id),
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
      ),
    );
  }
}
