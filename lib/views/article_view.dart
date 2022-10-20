import 'package:flutter/material.dart';
import 'package:nihon_shinbun/constants/default_value.dart';
import 'package:nihon_shinbun/models/view/route_argument.dart';
import 'package:nihon_shinbun/views/image_hero.dart';

class ArticleViewWidget extends StatefulWidget {
  const ArticleViewWidget({super.key});

  @override
  State<ArticleViewWidget> createState() => _ArticleViewWidgetState();
}

class _ArticleViewWidgetState extends State<ArticleViewWidget> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ArticleRouteArgument;

    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageHeroWidget(
                    imageUrl: defaultArticleImageUrl,
                    width: double.infinity,
                    tag: args.id),
                Text(args.id)
              ],
            ),
          )
        ],
      ),
    );
  }
}
