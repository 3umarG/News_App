import 'package:flutter/material.dart';
import 'package:news_app/controller/news_provider.dart';
import 'package:provider/provider.dart';

class NewsHomePage extends StatelessWidget {
  const NewsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: newsProvider.pages[newsProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: newsProvider.currentIndex,
        selectedItemColor: Colors.red,
        onTap: (newIndex) => newsProvider.changeIndex(newIndex),
        items: const [
          BottomNavigationBarItem(
            label: "Sports",
            icon: Icon(
              Icons.sports_soccer_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "Health",
            icon: Icon(
              Icons.health_and_safety_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Science",
            icon: Icon(
              Icons.science,
            ),
          ),
        ],
      ),
    );
  }
}
