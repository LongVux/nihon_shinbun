import 'package:flutter/material.dart';
import 'package:nihon_shinbun/constants/route.dart';
import 'package:nihon_shinbun/providers/main_page_provider.dart';
import 'package:provider/provider.dart';

class MainPageActionBtns extends StatelessWidget {
  const MainPageActionBtns({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  void _navigateTo(
      MainPageNestedRoute route, MainPageContextProvider mainPageContext) {
    navigatorKey.currentState!.pushNamed(route.toString());
    mainPageContext.changeRoute(route);
  }

  @override
  Widget build(BuildContext context) {
    final mainPageContext = Provider.of<MainPageContextProvider>(context);

    print(mainPageContext.getCurrentRoute);

    List<Widget> bottomActions = (mainPageContext.getCurrentRoute ==
            MainPageNestedRoute.article)
        ? [
            IconButton(
                onPressed: (() => {
                      mainPageContext.changeRoute(MainPageNestedRoute.articles),
                      navigatorKey.currentState!.pop(),
                    }),
                icon: const Icon(Icons.arrow_back_rounded)),
          ]
        : [];

    bottomActions.addAll([
      IconButton(
          onPressed: (() =>
              _navigateTo(MainPageNestedRoute.articles, mainPageContext)),
          icon: const Icon(Icons.article_rounded)),
      IconButton(
          onPressed: (() =>
              _navigateTo(MainPageNestedRoute.myArticles, mainPageContext)),
          icon: const Icon(Icons.bookmarks_rounded)),
      IconButton(
          onPressed: (() =>
              _navigateTo(MainPageNestedRoute.search, mainPageContext)),
          icon: const Icon(Icons.search_rounded))
    ]);

    return Row(
      children: bottomActions,
    );
  }
}
