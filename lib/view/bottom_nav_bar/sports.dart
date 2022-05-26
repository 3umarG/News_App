import 'package:flutter/material.dart';
import 'package:news_app/controller/news_provider.dart';
import 'package:news_app/view/news_card.dart';
import 'package:provider/provider.dart';

class SportsNewsPage extends StatelessWidget {
  const SportsNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: Provider.of<NewsProvider>(context).getData("sports"),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapShot.error != null) {
              return const Center(
                child: Text("An Error Ocuured"),
              );
            } else {
              return Consumer<NewsProvider>(
                builder: (context, newsProvider, _) {
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: newsProvider.newsArticle.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        image: newsProvider.newsArticle[index].urlToImage,
                        title: newsProvider.newsArticle[index].title,
                        description:
                            newsProvider.newsArticle[index].description,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 15,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
