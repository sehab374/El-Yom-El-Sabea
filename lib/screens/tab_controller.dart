import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/screens/news_card.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../models/sourceModel.dart';
import 'tab_item.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (value) {
                selectedindex = value;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => Tab(
                      child: TabItem(source,
                          widget.sources.indexOf(source) == selectedindex)))
                  .toList(),
            )),
        FutureBuilder<NewsDataModel>(
          future:
              ApiManager.getNewsData(widget.sources[selectedindex].id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            }

            if (snapshot.hasError) {
              return Column(
                children: [
                  Text(snapshot.data?.message ?? "something went wrong"),
                  TextButton(onPressed: () {}, child: Text("try again"))
                ],
              );
            }

            if (snapshot.data?.status != "ok") {
              return Column(
                children: [
                  Text(snapshot.data?.message ?? "something went wrong"),
                  TextButton(onPressed: () {}, child: Text("try again"))
                ],
              );
            }

            var news = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return NewsCard(news[index]);
                },
                itemCount: news.length,
              ),
            );
          },
        )
      ],
    );
  }
}
